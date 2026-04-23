#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"
require "json"

ROOT = File.expand_path("../..", __dir__)
MATERIAL2_TOKENS_PATH = File.join(ROOT, "tokens/material-colors.json")
MATERIAL3_ROLES_PATH = File.join(ROOT, "tokens/material3/color-scheme-roles.json")
MATERIAL3_BASELINE_PATH = File.join(ROOT, "tokens/material3/baseline-color-schemes.json")

def generated_header(prefix)
  "#{prefix} Generated from tokens/ by tools/codegen/generate.rb.\n" \
    "#{prefix} Do not edit by hand.\n\n"
end

def write_file(path, content, check:)
  absolute_path = File.join(ROOT, path)

  if check
    if !File.exist?(absolute_path) || File.read(absolute_path) != content
      warn "#{path} is out of date"
      $out_of_date = true
    end
    return
  end

  FileUtils.mkdir_p(File.dirname(absolute_path))
  File.write(absolute_path, content)
end

def swift_string(value)
  value.inspect
end

def python_const_name(name)
  name
    .gsub(/([a-z])([A-Z])/, "\\1_\\2")
    .gsub(/([A-Za-z])([0-9])/, "\\1_\\2")
    .upcase
end

def python_role_name(name)
  name.gsub(/([a-z])([A-Z])/, "\\1_\\2").downcase
end

def validate_material2_tokens(tokens)
  abort("tokens/material-colors.json must contain at least one token") if tokens.empty?

  tokens.each do |name, hex|
    abort("invalid token name: #{name}") unless name.match?(/\A[a-z][A-Za-z0-9]*\z/)
    abort("invalid hex for #{name}: #{hex}") unless hex.match?(/\A#[0-9A-F]{6}\z/)
  end
end

def validate_material3_tokens(roles, baseline)
  abort("tokens/material3/color-scheme-roles.json must contain at least one role") if roles.empty?
  abort("tokens/material3/baseline-color-schemes.json missing light scheme") unless baseline["light"].is_a?(Hash)
  abort("tokens/material3/baseline-color-schemes.json missing dark scheme") unless baseline["dark"].is_a?(Hash)

  roles.each do |role|
    abort("invalid Material 3 role: #{role}") unless role.match?(/\A[a-z][A-Za-z0-9]*\z/)

    %w[light dark].each do |appearance|
      hex = baseline.fetch(appearance).fetch(role, nil)
      abort("missing #{appearance}.#{role}") if hex.nil?
      abort("invalid hex for #{appearance}.#{role}: #{hex}") unless hex.match?(/\A#[0-9A-F]{6}\z/)
    end
  end

  source_color = baseline["sourceColor"]
  abort("invalid Material 3 sourceColor: #{source_color}") unless source_color.match?(/\A#[0-9A-F]{6}\z/)
end

def swift_scheme_static(name, appearance, roles, baseline)
  role_values = roles.map do |role|
    "    #{role}: MaterialColor(name: #{swift_string(role)}, hex: #{swift_string(baseline.fetch(appearance).fetch(role))})"
  end.join(",\n")

  <<~SWIFT.rstrip
      public static let #{name} = MaterialColorScheme(
        appearance: .#{appearance},
    #{role_values}
      )
  SWIFT
end

def swift_core(material2_tokens, material3_roles, material3_baseline)
  palette_constants = material2_tokens.map do |name, hex|
    "  public static let #{name} = MaterialColor(name: #{swift_string(name)}, hex: #{swift_string(hex)})"
  end.join("\n")

  palette_all_values = material2_tokens.keys.map { |name| "    #{name}," }.join("\n")
  scheme_properties = material3_roles.map { |role| "  public let #{role}: MaterialColor" }.join("\n")
  scheme_init_parameters = material3_roles.map { |role| "    #{role}: MaterialColor" }.join(",\n")
  scheme_init_assignments = material3_roles.map { |role| "    self.#{role} = #{role}" }.join("\n")
  light_scheme = swift_scheme_static("baselineLight", "light", material3_roles, material3_baseline)
  dark_scheme = swift_scheme_static("baselineDark", "dark", material3_roles, material3_baseline)

  <<~SWIFT
    #{generated_header("//").rstrip}
    public struct MaterialColor: Hashable, Sendable {
      public let name: String
      public let hex: String
      public let red: UInt8
      public let green: UInt8
      public let blue: UInt8
      public let alpha: UInt8

      internal init(name: String, hex: String) {
        let normalizedHex = hex.uppercased()
        precondition(normalizedHex.count == 7 && normalizedHex.first == "#", "Expected #RRGGBB hex color")

        guard let value = UInt32(String(normalizedHex.dropFirst()), radix: 16) else {
          preconditionFailure("Expected #RRGGBB hex color")
        }

        self.name = name
        self.hex = normalizedHex
        self.red = UInt8((value >> 16) & 0xFF)
        self.green = UInt8((value >> 8) & 0xFF)
        self.blue = UInt8(value & 0xFF)
        self.alpha = 0xFF
      }

      public var rgb: (red: UInt8, green: UInt8, blue: UInt8) {
        (red, green, blue)
      }

      public var argb: UInt32 {
        (UInt32(alpha) << 24) | (UInt32(red) << 16) | (UInt32(green) << 8) | UInt32(blue)
      }
    }

    public enum MaterialPalette {
    #{palette_constants}

      public static let all: [MaterialColor] = [
    #{palette_all_values}
      ]

      public static let byName: [String: MaterialColor] = Dictionary(
        uniqueKeysWithValues: all.map { ($0.name, $0) }
      )

      public static subscript(name: String) -> MaterialColor? {
        byName[name]
      }
    }

    public enum MaterialAppearance: String, Hashable, Sendable {
      case light
      case dark
    }

    public struct MaterialColorScheme: Hashable, Sendable {
      public let appearance: MaterialAppearance
    #{scheme_properties}

      public init(
        appearance: MaterialAppearance,
    #{scheme_init_parameters}
      ) {
        self.appearance = appearance
    #{scheme_init_assignments}
      }

    #{light_scheme}

    #{dark_scheme}

      public static func baseline(_ appearance: MaterialAppearance) -> MaterialColorScheme {
        switch appearance {
        case .light:
          return baselineLight
        case .dark:
          return baselineDark
        }
      }
    }

    public struct MaterialTheme: Hashable, Sendable {
      public let sourceColor: MaterialColor
      public let colorScheme: MaterialColorScheme

      public init(colorScheme: MaterialColorScheme, sourceColor: MaterialColor = MaterialTheme.materialSourceColor) {
        self.sourceColor = sourceColor
        self.colorScheme = colorScheme
      }

      public static let materialSourceColor = MaterialColor(name: "sourceColor", hex: #{swift_string(material3_baseline.fetch("sourceColor"))})

      public static let light = MaterialTheme(colorScheme: .baselineLight)
      public static let dark = MaterialTheme(colorScheme: .baselineDark)

      public static func baseline(_ appearance: MaterialAppearance) -> MaterialTheme {
        return MaterialTheme(colorScheme: .baseline(appearance))
      }
    }
  SWIFT
end

def swiftui_extensions(material2_tokens)
  constants = material2_tokens.keys.map do |name|
    "  static let #{name} = Color(materialColor: MaterialPalette.#{name})"
  end.join("\n")

  <<~SWIFT
    #{generated_header("//").rstrip}
    @_exported import MaterialDesignColorCore
    import SwiftUI

    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public extension Color {
      init(materialColor: MaterialColor) {
        self.init(
          .sRGB,
          red: Double(materialColor.red) / 255.0,
          green: Double(materialColor.green) / 255.0,
          blue: Double(materialColor.blue) / 255.0,
          opacity: Double(materialColor.alpha) / 255.0
        )
      }

    #{constants}
    }

    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public extension MaterialColor {
      var color: Color {
        Color(materialColor: self)
      }
    }

    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    private struct MaterialThemeEnvironmentKey: EnvironmentKey {
      static let defaultValue = MaterialTheme.light
    }

    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public extension EnvironmentValues {
      var materialTheme: MaterialTheme {
        get { self[MaterialThemeEnvironmentKey.self] }
        set { self[MaterialThemeEnvironmentKey.self] = newValue }
      }
    }

    @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
    public extension View {
      func materialTheme(_ theme: MaterialTheme) -> some View {
        environment(\\.materialTheme, theme)
      }
    }
  SWIFT
end

def uikit_extensions(material2_tokens)
  constants = material2_tokens.keys.map do |name|
    "  static let #{name} = UIColor(materialColor: MaterialPalette.#{name})"
  end.join("\n")

  <<~SWIFT
    #{generated_header("//").rstrip}
    #if canImport(UIKit)
    @_exported import MaterialDesignColorCore
    import UIKit

    public extension UIColor {
      convenience init(materialColor: MaterialColor) {
        self.init(
          red: CGFloat(materialColor.red) / 255.0,
          green: CGFloat(materialColor.green) / 255.0,
          blue: CGFloat(materialColor.blue) / 255.0,
          alpha: CGFloat(materialColor.alpha) / 255.0
        )
      }

    #{constants}
    }

    public extension MaterialColor {
      var uiColor: UIColor {
        UIColor(materialColor: self)
      }
    }
    #endif
  SWIFT
end

def react_native_colors(material2_tokens)
  values = material2_tokens.map do |name, hex|
    "  #{name}: #{hex.inspect},"
  end.join("\n")

  <<~TS
    #{generated_header("//").rstrip}
    export const colors = {
    #{values}
    } as const;

    export type MaterialColorName = keyof typeof colors;
    export type MaterialColorHex = (typeof colors)[MaterialColorName];

    export function getColor(name: MaterialColorName): MaterialColorHex {
      return colors[name];
    }
  TS
end

def react_native_color_scheme(roles, baseline)
  role_values = roles.map { |role| "  #{role.inspect}," }.join("\n")
  light_values = baseline.fetch("light").map { |role, hex| "  #{role}: #{hex.inspect}," }.join("\n")
  dark_values = baseline.fetch("dark").map { |role, hex| "  #{role}: #{hex.inspect}," }.join("\n")

  <<~TS
    #{generated_header("//").rstrip}
    export const materialColorSchemeRoles = [
    #{role_values}
    ] as const;

    export const materialSourceColor = #{baseline.fetch("sourceColor").inspect};

    export const lightColorScheme = {
    #{light_values}
    } as const;

    export const darkColorScheme = {
    #{dark_values}
    } as const;

    export type MaterialColorRole = (typeof materialColorSchemeRoles)[number];
    export type MaterialColorScheme = {
      readonly [Role in MaterialColorRole]: string;
    };

    export type MaterialColorSchemeInput = Partial<Record<MaterialColorRole, string>>;

    export interface MaterialTheme {
      readonly dark: boolean;
      readonly sourceColor: string;
      readonly colorScheme: MaterialColorScheme;
    }

    export interface MaterialThemeOptions {
      readonly dark?: boolean;
      readonly colorScheme?: MaterialColorSchemeInput;
    }

    export function createMaterialTheme(options: MaterialThemeOptions = {}): MaterialTheme {
      const dark = options.dark ?? false;
      const base = dark ? darkColorScheme : lightColorScheme;

      return {
        dark,
        sourceColor: materialSourceColor,
        colorScheme: {
          ...base,
          ...options.colorScheme,
        },
      };
    }

    export function getSchemeColor(
      colorScheme: MaterialColorScheme,
      role: MaterialColorRole,
    ): string {
      return colorScheme[role];
    }
  TS
end

def python_colors(material2_tokens)
  color_attrs = material2_tokens.map do |name, hex|
    "    #{name} = #{hex.inspect}"
  end.join("\n")

  material_attrs = material2_tokens.map do |name, hex|
    "    #{python_const_name(name)} = MaterialColor(#{name.inspect}, #{hex.inspect})"
  end.join("\n")

  all_values = material2_tokens.keys.map do |name|
    "    MaterialColors.#{python_const_name(name)},"
  end.join("\n")

  <<~PYTHON
    #{generated_header("#").rstrip}
    from __future__ import annotations

    from dataclasses import dataclass
    from typing import Dict, Tuple


    @dataclass(frozen=True)
    class MaterialColor:
        name: str
        hex: str

        @property
        def rgb(self) -> Tuple[int, int, int]:
            value = self.hex.lstrip("#")
            return (
                int(value[0:2], 16),
                int(value[2:4], 16),
                int(value[4:6], 16),
            )


    class _Colors:
    #{color_attrs}


    colors = _Colors()


    class MaterialColors:
    #{material_attrs}


    ALL = (
    #{all_values}
    )

    BY_NAME: Dict[str, MaterialColor] = {color.name: color for color in ALL}


    def get_color(name: str) -> MaterialColor:
        return BY_NAME[name]
  PYTHON
end

def python_scheme(name, appearance, roles, baseline)
  values = roles.map do |role|
    "    #{python_role_name(role)}=MaterialColor(#{role.inspect}, #{baseline.fetch(appearance).fetch(role).inspect}),"
  end.join("\n")

  <<~PYTHON.rstrip
    #{name} = MaterialColorScheme(
        appearance=#{appearance.inspect},
    #{values}
    )
  PYTHON
end

def python_theme(roles, baseline)
  fields = roles.map { |role| "    #{python_role_name(role)}: MaterialColor" }.join("\n")
  role_fields = roles.map { |role| "    #{role.inspect}: #{python_role_name(role).inspect}," }.join("\n")

  light_scheme = python_scheme("LIGHT_COLOR_SCHEME", "light", roles, baseline)
  dark_scheme = python_scheme("DARK_COLOR_SCHEME", "dark", roles, baseline)

  <<~PYTHON
    #{generated_header("#").rstrip}
    from __future__ import annotations

    from dataclasses import dataclass
    from typing import Dict, Optional, Tuple

    from .colors import MaterialColor


    COLOR_SCHEME_ROLES: Tuple[str, ...] = (
    #{roles.map { |role| "    #{role.inspect}," }.join("\n")}
    )

    ROLE_FIELDS: Dict[str, str] = {
    #{role_fields}
    }


    @dataclass(frozen=True)
    class MaterialColorScheme:
        appearance: str
    #{fields}

        def role_color(self, role: str) -> MaterialColor:
            return getattr(self, ROLE_FIELDS[role])

        def as_hex_map(self) -> Dict[str, str]:
            """Map of camelCase role name to ``#RRGGBB`` hex. Not a round-trip
            of the dataclass: fields are snake_case ``MaterialColor`` instances."""
            return {role: self.role_color(role).hex for role in COLOR_SCHEME_ROLES}


    MATERIAL_SOURCE_COLOR = MaterialColor("sourceColor", #{baseline.fetch("sourceColor").inspect})


    @dataclass(frozen=True)
    class MaterialTheme:
        color_scheme: MaterialColorScheme
        source_color: MaterialColor = MATERIAL_SOURCE_COLOR


    #{light_scheme}


    #{dark_scheme}


    def baseline_color_scheme(dark: bool = False) -> MaterialColorScheme:
        return DARK_COLOR_SCHEME if dark else LIGHT_COLOR_SCHEME


    def create_theme(dark: bool = False, color_scheme: Optional[MaterialColorScheme] = None) -> MaterialTheme:
        return MaterialTheme(color_scheme=color_scheme or baseline_color_scheme(dark))
  PYTHON
end

def load_tokens(path)
  # JSON-Schema 메타 키($schema 등)를 제거해 토큰으로 순회되지 않도록 한다.
  # 평면 구조의 토큰 파일에만 적용한다. M3 파일은 구조가 고정되어 있고
  # (sourceColor / variant / contrastLevel / light / dark) 생성기가 알고 있는
  # 키만 골라 읽으므로 raw 로 파싱한다.
  JSON.parse(File.read(path)).reject { |key, _| key.start_with?("$") }
end

check = ARGV.include?("--check")
material2_tokens = load_tokens(MATERIAL2_TOKENS_PATH)
material3_roles = JSON.parse(File.read(MATERIAL3_ROLES_PATH))
material3_baseline = JSON.parse(File.read(MATERIAL3_BASELINE_PATH))

validate_material2_tokens(material2_tokens)
validate_material3_tokens(material3_roles, material3_baseline)

write_file(
  "packages/ios/Sources/MaterialDesignColorCore/MaterialDesignColor.swift",
  swift_core(material2_tokens, material3_roles, material3_baseline),
  check: check
)
write_file(
  "packages/ios/Sources/MaterialDesignColorSwiftUI/Color+MaterialDesignColor.swift",
  swiftui_extensions(material2_tokens),
  check: check
)
write_file(
  "packages/ios/Sources/MaterialDesignColorUIKit/UIColor+MaterialDesignColor.swift",
  uikit_extensions(material2_tokens),
  check: check
)
write_file(
  "packages/react-native/src/colors.ts",
  react_native_colors(material2_tokens),
  check: check
)
write_file(
  "packages/react-native/src/colorScheme.ts",
  react_native_color_scheme(material3_roles, material3_baseline),
  check: check
)
write_file(
  "packages/python/src/material_design_color/colors.py",
  python_colors(material2_tokens),
  check: check
)
write_file(
  "packages/python/src/material_design_color/theme.py",
  python_theme(material3_roles, material3_baseline),
  check: check
)

exit(1) if check && $out_of_date
