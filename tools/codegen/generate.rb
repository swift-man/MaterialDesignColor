#!/usr/bin/env ruby
# frozen_string_literal: true

require "fileutils"
require "json"

ROOT = File.expand_path("../..", __dir__)
MATERIAL2_TOKENS_PATH = File.join(ROOT, "tokens/material-colors.json")
MATERIAL3_ROLES_PATH = File.join(ROOT, "tokens/material3/color-scheme-roles.json")
MATERIAL3_BASELINE_PATH = File.join(ROOT, "tokens/material3/baseline-color-schemes.json")
MATERIAL3_PRESETS_PATH = File.join(ROOT, "tokens/material3/theme-presets.json")

def validate_extended_tokens(data)
  abort("extended color tokens must be an object") unless data.is_a?(Hash)
  %w[light dark].each do |mode|
    abort("extended.#{mode} must be a non-empty role map") unless data[mode].is_a?(Hash) && !data[mode].empty?
  end
  abort("extended light/dark role names must match") unless data["light"].keys.sort == data["dark"].keys.sort
  data["light"].keys.each do |role|
    abort("invalid extended role name: #{role}") unless role.match?(/\A[a-z][A-Za-z0-9]*\z/)
    %w[light dark].each { |mode| validate_hex!(data[mode][role], "extended.#{mode}.#{role}") }
  end
end

def swift_extended
  cases = EXTENDED_ROLES.map { |r| "  /// Custom status role `#{r}` (outside the 48 M3 roles).\n  case #{r}" }.join("\n")
  statics = %w[light dark].map do |mode|
    values = EXTENDED_ROLES.map { |r| "      .#{r}: MaterialColor(uncheckedName: #{r.inspect}, hex: #{EXTENDED.fetch(mode).fetch(r).inspect})" }.join(",\n")
    "  /// Harmonized #{mode} status colors for the default source color.\n  public static let #{mode} = MaterialExtendedColors(values: [\n#{values}\n  ])"
  end.join("\n")
  <<~SWIFT
    /// Custom status roles, separate from Google's 48 Material 3 roles.
    public enum MaterialExtendedColorRole: String, CaseIterable, Hashable, Sendable {
    #{cases}
    }
    /// Immutable custom colors. Templates are harmonized; final app values are preserved.
    public struct MaterialExtendedColors: Hashable, Sendable {
      private let values: [MaterialExtendedColorRole: MaterialColor]
      private init(values: [MaterialExtendedColorRole: MaterialColor]) { self.values = values }
      /// Constructs all custom roles from final app-owned colors without harmonization.
      public init(
    #{EXTENDED_ROLES.map { |r| "    #{r}: MaterialColor" }.join(",\n")}
      ) {
        self.values = [
    #{EXTENDED_ROLES.map { |r| "      .#{r}: #{r}" }.join(",\n")}
        ]
      }
      /// Returns a copy with final app-owned colors, preserving omitted roles.
      @_disfavoredOverload
      public func overriding(_ overrides: [MaterialExtendedColorRole: MaterialColor]) -> Self {
        Self(values: values.merging(overrides) { _, appColor in appColor })
      }
      /// Returns a status color; every instance contains every extended role.
      public subscript(role: MaterialExtendedColorRole) -> MaterialColor { values[role]! }
      /// Returns a copy with validated #RRGGBB overrides.
      public func overriding(_ overrides: [MaterialExtendedColorRole: String]) throws -> Self {
        var result = values
        for (role, hex) in overrides { result[role] = try MaterialColor(name: role.rawValue, hex: hex) }
        return Self(values: result)
      }
    #{statics}
    }
  SWIFT
end

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

def python_const_name_from_camel(name)
  python_role_name(name).upcase
end

def swift_static_name(preset, appearance)
  "#{preset}#{appearance.capitalize}"
end

def python_scheme_name(preset, appearance)
  "#{python_const_name_from_camel(preset)}_#{appearance.upcase}_COLOR_SCHEME"
end

def ts_literal(value)
  JSON.pretty_generate(value)
    .lines
    .map { |line| "    #{line}" }
    .join
    .strip
end

def validate_hex!(hex, label)
  abort("missing #{label}") if hex.nil?
  abort("invalid hex for #{label}: #{hex}") unless hex.is_a?(String) && hex.match?(/\A#[0-9A-F]{6}\z/)
end

def validate_material2_tokens(tokens)
  abort("tokens/material-colors.json must contain at least one token") if tokens.empty?

  tokens.each do |name, hex|
    abort("invalid token name: #{name}") unless name.match?(/\A[a-z][A-Za-z0-9]*\z/)
    validate_hex!(hex, name)
  end
end

def validate_material3_tokens(roles, baseline, presets)
  abort("tokens/material3/color-scheme-roles.json must contain at least one role") if roles.empty?
  abort("tokens/material3/baseline-color-schemes.json missing light scheme") unless baseline["light"].is_a?(Hash)
  abort("tokens/material3/baseline-color-schemes.json missing dark scheme") unless baseline["dark"].is_a?(Hash)
  abort("tokens/material3/theme-presets.json missing tonalSpot preset") unless presets["tonalSpot"].is_a?(Hash)

  roles.each do |role|
    abort("invalid Material 3 role: #{role}") unless role.match?(/\A[a-z][A-Za-z0-9]*\z/)

    %w[light dark].each do |appearance|
      hex = baseline.fetch(appearance).fetch(role, nil)
      validate_hex!(hex, "#{appearance}.#{role}")
    end
  end

  source_color = baseline["sourceColor"]
  validate_hex!(source_color, "baseline.sourceColor")

  presets.each do |preset, data|
    abort("invalid Material 3 preset name: #{preset}") unless preset.match?(/\A[a-z][A-Za-z0-9]*\z/)
    abort("tokens/material3/theme-presets.json #{preset} missing light scheme") unless data["light"].is_a?(Hash)
    abort("tokens/material3/theme-presets.json #{preset} missing dark scheme") unless data["dark"].is_a?(Hash)
    abort("tokens/material3/theme-presets.json #{preset} missing key colors") unless data["keyColors"].is_a?(Hash)
    abort("tokens/material3/theme-presets.json #{preset} missing tonal palettes") unless data["tonalPalettes"].is_a?(Hash)

    source = data["sourceColor"]
    validate_hex!(source, "#{preset}.sourceColor")

    %w[primary secondary tertiary neutral neutralVariant].each do |key_color|
      hex = data.fetch("keyColors").fetch(key_color, nil)
      validate_hex!(hex, "#{preset}.keyColors.#{key_color}")
    end

    %w[primary secondary tertiary neutral neutralVariant error].each do |palette|
      tones = data.fetch("tonalPalettes").fetch(palette, nil)
      abort("missing #{preset}.tonalPalettes.#{palette}") unless tones.is_a?(Hash)

      tones.each do |tone, hex|
        abort("invalid tone for #{preset}.tonalPalettes.#{palette}: #{tone}") unless tone.match?(/\A[0-9]+\z/)
        validate_hex!(hex, "#{preset}.tonalPalettes.#{palette}.#{tone}")
      end
    end

    roles.each do |role|
      %w[light dark].each do |appearance|
        hex = data.fetch(appearance).fetch(role, nil)
        validate_hex!(hex, "#{preset}.#{appearance}.#{role}")
      end
    end
  end

  tonal_spot = presets.fetch("tonalSpot")
  %w[sourceColor variant contrastLevel light dark].each do |key|
    abort("baseline #{key} differs from tonalSpot preset") unless baseline[key] == tonal_spot[key]
  end
end

def swift_scheme_static(name, appearance, roles, scheme)
  role_values = roles.map do |role|
    "    #{role}: MaterialColor(uncheckedName: #{swift_string(role)}, hex: #{swift_string(scheme.fetch(role))})"
  end.join(",\n")

  <<~SWIFT.rstrip
      public static let #{name} = MaterialColorScheme(
        appearance: .#{appearance},
    #{role_values}
      )
  SWIFT
end

# One semantic adjacency contract shared by every platform.
def contrast_pairs
  pairs = %w[primary secondary tertiary error].flat_map do |r|
    cap = r[0].upcase + r[1..]
    [[r, "on#{cap}"], ["#{r}Container", "on#{cap}Container"]]
  end
  pairs += [["background", "onBackground"], ["surface", "onSurface"], ["surfaceVariant", "onSurfaceVariant"], ["inverseSurface", "inverseOnSurface"]]
  pairs += %w[surfaceBright surfaceContainer surfaceContainerHigh surfaceContainerHighest surfaceContainerLow surfaceContainerLowest surfaceDim].map { |r| [r, "onSurface"] }
  pairs += %w[primary secondary tertiary].flat_map do |r|
    cap = r[0].upcase + r[1..]
    ["#{r}Fixed", "#{r}FixedDim"].product(["on#{cap}Fixed", "on#{cap}FixedVariant"])
  end
  pairs += EXTENDED_ROLES.filter_map do |r|
    on = "on#{r[0].upcase}#{r[1..]}"
    [r, on] if EXTENDED_ROLES.include?(on)
  end
  pairs
end

def swift_core(material2_tokens, material3_roles, material3_presets)
  palette_constants = material2_tokens.map do |name, hex|
    "  public static let #{name} = MaterialColor(uncheckedName: #{swift_string(name)}, hex: #{swift_string(hex)})"
  end.join("\n")

  palette_all_values = material2_tokens.keys.map { |name| "    #{name}," }.join("\n")
  role_cases = material3_roles.map { |role| "  case #{role}" }.join("\n")
  scheme_properties = material3_roles.map { |role| "  public let #{role}: MaterialColor" }.join("\n")
  scheme_init_parameters = material3_roles.map { |role| "    #{role}: MaterialColor" }.join(",\n")
  scheme_init_assignments = material3_roles.map { |role| "    self.#{role} = #{role}" }.join("\n")
  scheme_role_switch = material3_roles.map do |role|
    "    case .#{role}:\n      return #{role}"
  end.join("\n")
  scheme_override_parameters = material3_roles.map do |role|
    "      #{role}: try overrides[.#{role}].map { try MaterialColor(role: .#{role}, hex: $0) } ?? #{role}"
  end.join(",\n")
  scheme_custom_parameters = material3_roles.map do |role|
    "      #{role}: try color(.#{role}, in: roles)"
  end.join(",\n")
  preset_cases = material3_presets.keys.map { |preset| "  case #{preset}" }.join("\n")
  preset_scheme_statics = material3_presets.flat_map do |preset, data|
    [
      swift_scheme_static(swift_static_name(preset, "light"), "light", material3_roles, data.fetch("light")),
      swift_scheme_static(swift_static_name(preset, "dark"), "dark", material3_roles, data.fetch("dark"))
    ]
  end.join("\n\n")
  preset_scheme_switch = material3_presets.keys.map do |preset|
    [
      "    case (.#{preset}, .light):",
      "      return #{swift_static_name(preset, "light")}",
      "    case (.#{preset}, .dark):",
      "      return #{swift_static_name(preset, "dark")}"
    ].join("\n")
  end.join("\n")
  preset_source_color_switch = material3_presets.map do |preset, data|
    "    case .#{preset}:\n      return MaterialColor(uncheckedName: \"sourceColor\", hex: #{swift_string(data.fetch("sourceColor"))})"
  end.join("\n")
  preset_key_colors_switch = material3_presets.map do |preset, data|
    key_colors = data.fetch("keyColors")
    [
      "    case .#{preset}:",
      "      return MaterialThemeKeyColors(",
      "        primary: MaterialColor(uncheckedName: \"primary\", hex: #{swift_string(key_colors.fetch("primary"))}),",
      "        secondary: MaterialColor(uncheckedName: \"secondary\", hex: #{swift_string(key_colors.fetch("secondary"))}),",
      "        tertiary: MaterialColor(uncheckedName: \"tertiary\", hex: #{swift_string(key_colors.fetch("tertiary"))}),",
      "        neutral: MaterialColor(uncheckedName: \"neutral\", hex: #{swift_string(key_colors.fetch("neutral"))}),",
      "        neutralVariant: MaterialColor(uncheckedName: \"neutralVariant\", hex: #{swift_string(key_colors.fetch("neutralVariant"))})",
      "      )"
    ].join("\n")
  end.join("\n")
  tonal_spot = material3_presets.fetch("tonalSpot")

  <<~SWIFT
    #{generated_header("//").rstrip}
    import Foundation

    public enum MaterialColorRole: String, CaseIterable, Hashable, Sendable {
    #{role_cases}
    }

    public enum MaterialColorSchemeError: Error, Equatable, Sendable {
      case missingRoles([MaterialColorRole])
    }

    public enum MaterialColorError: Error, Equatable, Sendable {
      case invalidHex(String)
    }

    public struct MaterialColor: Hashable, Sendable {
      public let name: String
      public let hex: String
      public let red: UInt8
      public let green: UInt8
      public let blue: UInt8
      public let alpha: UInt8

      /// Creates an opaque sRGB color from byte components (0...255).
      /// No hex parsing, harmonization, or gamut conversion is performed.
      public init(name: String, red: UInt8, green: UInt8, blue: UInt8) {
        let value = (UInt32(red) << 16) | (UInt32(green) << 8) | UInt32(blue)
        let digits = String(value, radix: 16, uppercase: true)
        self.init(name: name, normalizedHex: "#" + String(repeating: "0", count: 6 - digits.count) + digits, value: value)
      }

      /// Creates an opaque sRGB color named for a standard role from byte components.
      public init(role: MaterialColorRole, red: UInt8, green: UInt8, blue: UInt8) {
        self.init(name: role.rawValue, red: red, green: green, blue: blue)
      }

      /// WCAG 2.x contrast ratio of two opaque sRGB colors, from 1 to 21.
      /// Compare the actual adjacent colors; translucent UI must be composited first.
      public func contrastRatio(with other: MaterialColor) -> Double {
        func luminance(_ color: MaterialColor) -> Double {
          func linear(_ byte: UInt8) -> Double {
            let c = Double(byte) / 255
            return c <= 0.04045 ? c / 12.92 : pow((c + 0.055) / 1.055, 2.4)
          }
          return 0.2126 * linear(color.red) + 0.7152 * linear(color.green) + 0.0722 * linear(color.blue)
        }
        let a = luminance(self), b = luminance(other)
        return (max(a, b) + 0.05) / (min(a, b) + 0.05)
      }

      public init(name: String, hex: String) throws {
        guard let parsed = Self.parseHex(hex) else {
          throw MaterialColorError.invalidHex(hex)
        }

        self.init(name: name, normalizedHex: parsed.normalizedHex, value: parsed.value)
      }

      public init(role: MaterialColorRole, hex: String) throws {
        try self.init(name: role.rawValue, hex: hex)
      }

      fileprivate init(uncheckedName name: String, hex: String) {
        guard let parsed = Self.parseHex(hex) else {
          preconditionFailure("Expected generated #RRGGBB hex color")
        }

        self.init(name: name, normalizedHex: parsed.normalizedHex, value: parsed.value)
      }

      private init(name: String, normalizedHex: String, value: UInt32) {
        self.name = name
        self.hex = normalizedHex
        self.red = UInt8((value >> 16) & 0xFF)
        self.green = UInt8((value >> 8) & 0xFF)
        self.blue = UInt8(value & 0xFF)
        self.alpha = 0xFF
      }

      private static func parseHex(_ hex: String) -> (normalizedHex: String, value: UInt32)? {
        let normalizedHex = hex.uppercased()

        guard normalizedHex.count == 7,
              normalizedHex.first == "#",
              let value = UInt32(normalizedHex.dropFirst(), radix: 16) else {
          return nil
        }

        return (normalizedHex, value)
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

    public struct MaterialThemeKeyColors: Hashable, Sendable {
      public let primary: MaterialColor
      public let secondary: MaterialColor
      public let tertiary: MaterialColor
      public let neutral: MaterialColor
      public let neutralVariant: MaterialColor

      public init(
        primary: MaterialColor,
        secondary: MaterialColor,
        tertiary: MaterialColor,
        neutral: MaterialColor,
        neutralVariant: MaterialColor
      ) {
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
        self.neutral = neutral
        self.neutralVariant = neutralVariant
      }
    }

    public enum MaterialThemePreset: String, CaseIterable, Hashable, Sendable {
    #{preset_cases}

      public var sourceColor: MaterialColor {
        switch self {
    #{preset_source_color_switch}
        }
      }

      public var keyColors: MaterialThemeKeyColors {
        switch self {
    #{preset_key_colors_switch}
        }
      }
    }

    /// Invalid external input to contrast validation.
    /// Equality compares thresholds numerically, treating all NaN thresholds as equal.
    /// The original threshold remains available through pattern matching.
    public enum MaterialContrastError: Error, Equatable, Sendable {
      /// The requested threshold is not finite or is outside 1...21.
      case invalidMinimum(Double)

      /// Compares diagnostic values; all NaNs represent the same invalid-input category.
      /// Other values use Double equality, including signed zero and infinity.
      public static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.invalidMinimum(a), .invalidMinimum(b)):
          return a == b || (a.isNaN && b.isNaN)
        }
      }
    }

    /// A failing semantic fill/content pair in an app's final scheme.
    public struct MaterialContrastIssue: Hashable, Sendable {
      /// Camel-case standard or extended background role name.
      public let colorRole: String
      /// Camel-case standard or extended foreground role name.
      public let onRole: String
      /// WCAG 2.x contrast ratio, without rounding.
      public let ratio: Double

      /// Creates a diagnostic value, for example an expected result in an app test.
      /// Fields are stored verbatim; this initializer does not measure colors or validate roles.
      public init(colorRole: String, onRole: String, ratio: Double) {
        self.colorRole = colorRole
        self.onRole = onRole
        self.ratio = ratio
      }
    }

    #{swift_extended}
    public struct MaterialColorScheme: Hashable, Sendable {
      /// Custom status colors, separate from the standard M3 role collection.
      public let extendedColors: MaterialExtendedColors
    #{EXTENDED_ROLES.map { |r| "  /// Custom status color `#{r}`: template default or final app-owned value.\n  public var #{r}: MaterialColor { extendedColors[.#{r}] }" }.join("\n")}

      /// Returns a copy with validated custom status color overrides.
      public func overridingExtended(_ overrides: [MaterialExtendedColorRole: String]) throws -> Self {
        Self(appearance: appearance,
    #{material3_roles.map { |r| "      #{r}: #{r}," }.join("\n")}
          extendedColors: try extendedColors.overriding(overrides))
      }
      /// Overrides custom roles with app-owned colors; omitted roles are preserved.
      @_disfavoredOverload
      public func overridingExtended(_ overrides: [MaterialExtendedColorRole: MaterialColor]) -> Self {
        Self(appearance: appearance,
    #{material3_roles.map { |r| "      #{r}: #{r}," }.join("\n")}
          extendedColors: extendedColors.overriding(overrides))
      }

      /// Overrides standard roles with app-owned colors, preserving all other values.
      @_disfavoredOverload
      public func overriding(_ overrides: [MaterialColorRole: MaterialColor]) -> Self {
        Self(appearance: appearance,
    #{material3_roles.map { |r| "      #{r}: overrides[.#{r}] ?? #{r}," }.join("\n")}
          extendedColors: extendedColors)
      }

      /// Applies final app colors over a preset, without hex parsing or harmonization.
      @_disfavoredOverload
      public static func custom(base: MaterialThemePreset = .tonalSpot,
                                appearance: MaterialAppearance,
                                overrides: [MaterialColorRole: MaterialColor]) -> Self {
        preset(base, appearance: appearance).overriding(overrides)
      }

      /// Reports semantic fill/on-fill pairs below the threshold (default 4.5).
      /// Includes standard, surface, inverse, fixed/dim, and custom status pairs.
      /// This does not infer arbitrary UI adjacency. Minimum must be finite and in 1...21.
      public func contrastIssues(minimum: Double = 4.5) -> [MaterialContrastIssue] {
        precondition(minimum.isFinite && (1...21).contains(minimum), "minimum must be in 1...21")
        let pairs: [(String, String, MaterialColor, MaterialColor)] = [
    #{contrast_pairs.map { |a,b| "      (\"#{a}\", \"#{b}\", #{a}, #{b})" }.join(",\n")}
        ]
        return pairs.compactMap { colorRole, onRole, color, onColor in
          let ratio = color.contrastRatio(with: onColor)
          return ratio < minimum ? MaterialContrastIssue(colorRole: colorRole, onRole: onRole, ratio: ratio) : nil
        }
      }

      /// Checks an external threshold without trapping or silently clamping it.
      /// - Throws: `MaterialContrastError.invalidMinimum` unless minimum is finite and in 1...21.
      /// - Returns: The same semantic pair diagnostics as `contrastIssues(minimum:)`.
      public func validatedContrastIssues(minimum: Double = 4.5) throws -> [MaterialContrastIssue] {
        guard minimum.isFinite && (1...21).contains(minimum) else {
          throw MaterialContrastError.invalidMinimum(minimum)
        }
        return contrastIssues(minimum: minimum)
      }

      public let appearance: MaterialAppearance
    #{scheme_properties}

      public init(
        appearance: MaterialAppearance,
    #{scheme_init_parameters},
        extendedColors: MaterialExtendedColors? = nil
      ) {
        self.appearance = appearance
        self.extendedColors = extendedColors ?? (appearance == .dark ? .dark : .light)
    #{scheme_init_assignments}
      }

      public func color(for role: MaterialColorRole) -> MaterialColor {
        switch role {
    #{scheme_role_switch}
        }
      }

      public subscript(role: MaterialColorRole) -> MaterialColor {
        color(for: role)
      }

      public func overriding(_ overrides: [MaterialColorRole: String]) throws -> MaterialColorScheme {
        MaterialColorScheme(
          appearance: appearance,
    #{scheme_override_parameters},
          extendedColors: extendedColors
        )
      }

      private static func color(_ role: MaterialColorRole, in roles: [MaterialColorRole: String]) throws -> MaterialColor {
        guard let hex = roles[role] else {
          throw MaterialColorSchemeError.missingRoles([role])
        }

        return try MaterialColor(role: role, hex: hex)
      }

      public static func custom(appearance: MaterialAppearance, roles: [MaterialColorRole: String]) throws -> MaterialColorScheme {
        let missingRoles = MaterialColorRole.allCases.filter { roles[$0] == nil }

        guard missingRoles.isEmpty else {
          throw MaterialColorSchemeError.missingRoles(missingRoles)
        }

        return MaterialColorScheme(
          appearance: appearance,
    #{scheme_custom_parameters}
        )
      }

      public static func custom(
        base: MaterialThemePreset = .tonalSpot,
        appearance: MaterialAppearance,
        overrides: [MaterialColorRole: String]
      ) throws -> MaterialColorScheme {
        try preset(base, appearance: appearance).overriding(overrides)
      }

    #{preset_scheme_statics}

      public static let baselineLight = tonalSpotLight
      public static let baselineDark = tonalSpotDark

      public static func preset(_ preset: MaterialThemePreset, appearance: MaterialAppearance) -> MaterialColorScheme {
        switch (preset, appearance) {
    #{preset_scheme_switch}
        }
      }

      public static func baseline(_ appearance: MaterialAppearance) -> MaterialColorScheme {
        preset(.tonalSpot, appearance: appearance)
      }
    }

    /// Immutable app-owned light/dark themes for SwiftUI, UIKit, or AppKit injection.
    public struct MaterialThemePair: Hashable, Sendable {
      /// Final light theme.
      public let light: MaterialTheme
      /// Final dark theme.
      public let dark: MaterialTheme

      /// Groups existing themes for light and dark presentation without altering their colors.
      /// Argument labels select their intended UI use; scheme appearance metadata is preserved,
      /// not validated or rewritten. Supply the appropriate scheme for each appearance.
      public init(light: MaterialTheme, dark: MaterialTheme) {
        self.light = light
        self.dark = dark
      }
    }

    public struct MaterialTheme: Hashable, Sendable {
      public let sourceColor: MaterialColor
      public let colorScheme: MaterialColorScheme
      public let themePreset: MaterialThemePreset?

      public init(
        colorScheme: MaterialColorScheme,
        sourceColor: MaterialColor = MaterialTheme.materialSourceColor,
        themePreset: MaterialThemePreset? = nil
      ) {
        self.sourceColor = sourceColor
        self.colorScheme = colorScheme
        self.themePreset = themePreset
      }

      /// Creates both appearances by overlaying final app values on template defaults.
      /// Omitted roles retain their preset/template value; no input is harmonized.
      public static func pair(
        preset: MaterialThemePreset = .tonalSpot,
        light: [MaterialColorRole: MaterialColor] = [:],
        dark: [MaterialColorRole: MaterialColor] = [:],
        extendedLight: [MaterialExtendedColorRole: MaterialColor] = [:],
        extendedDark: [MaterialExtendedColorRole: MaterialColor] = [:]
      ) -> MaterialThemePair {
        func make(_ appearance: MaterialAppearance, _ roles: [MaterialColorRole: MaterialColor],
                  _ extended: [MaterialExtendedColorRole: MaterialColor]) -> MaterialTheme {
          MaterialTheme(colorScheme: MaterialColorScheme.preset(preset, appearance: appearance)
            .overriding(roles).overridingExtended(extended), sourceColor: preset.sourceColor)
        }
        return MaterialThemePair(light: make(.light, light, extendedLight), dark: make(.dark, dark, extendedDark))
      }

      /// Applies final app colors over one preset appearance; sourceColor is metadata only.
      @_disfavoredOverload
      public static func custom(base: MaterialThemePreset = .tonalSpot,
                                appearance: MaterialAppearance,
                                overrides: [MaterialColorRole: MaterialColor],
                                sourceColor: MaterialColor? = nil) -> MaterialTheme {
        MaterialTheme(colorScheme: .custom(base: base, appearance: appearance, overrides: overrides),
                      sourceColor: sourceColor ?? base.sourceColor)
      }

      public static let materialSourceColor = MaterialColor(uncheckedName: "sourceColor", hex: #{swift_string(tonal_spot.fetch("sourceColor"))})

      public static let light = MaterialTheme.preset(.tonalSpot, appearance: .light)
      public static let dark = MaterialTheme.preset(.tonalSpot, appearance: .dark)

      public static func preset(_ preset: MaterialThemePreset, appearance: MaterialAppearance) -> MaterialTheme {
        MaterialTheme(
          colorScheme: .preset(preset, appearance: appearance),
          sourceColor: preset.sourceColor,
          themePreset: preset
        )
      }

      public static func custom(
        base: MaterialThemePreset = .tonalSpot,
        appearance: MaterialAppearance,
        overrides: [MaterialColorRole: String],
        sourceColor: String? = nil
      ) throws -> MaterialTheme {
        let resolvedSourceColor = try sourceColor.map { try MaterialColor(name: "sourceColor", hex: $0) } ?? base.sourceColor

        return MaterialTheme(
          colorScheme: try .custom(base: base, appearance: appearance, overrides: overrides),
          sourceColor: resolvedSourceColor
        )
      }

      public static func custom(
        appearance: MaterialAppearance,
        roles: [MaterialColorRole: String],
        sourceColor: String? = nil
      ) throws -> MaterialTheme {
        let resolvedSourceColor = try sourceColor.map { try MaterialColor(name: "sourceColor", hex: $0) } ?? materialSourceColor

        return MaterialTheme(
          colorScheme: try .custom(appearance: appearance, roles: roles),
          sourceColor: resolvedSourceColor
        )
      }

      public static func baseline(_ appearance: MaterialAppearance) -> MaterialTheme {
        preset(.tonalSpot, appearance: appearance)
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

def react_native_color_scheme(roles, presets)
  role_values = roles.map { |role| "  #{role.inspect}," }.join("\n")
  preset_values = presets.keys.map { |preset| "  #{preset.inspect}," }.join("\n")
  tonal_spot = presets.fetch("tonalSpot")
  preset_schemes = presets.transform_values do |data|
    {
      "light" => data.fetch("light").merge(EXTENDED.fetch("light")),
      "dark" => data.fetch("dark").merge(EXTENDED.fetch("dark"))
    }
  end
  preset_source_colors = presets.transform_values { |data| data.fetch("sourceColor") }
  preset_key_colors = presets.transform_values { |data| data.fetch("keyColors") }

  <<~TS
    #{generated_header("//").rstrip}
    type DeepReadonly<T> = T extends object
      ? { readonly [Key in keyof T]: DeepReadonly<T[Key]> }
      : T;

    function deepFreeze<T extends object>(value: T): DeepReadonly<T> {
      for (const nestedValue of Object.values(value)) {
        if (nestedValue !== null && typeof nestedValue === "object") {
          deepFreeze(nestedValue);
        }
      }

      return Object.freeze(value) as DeepReadonly<T>;
    }

    function validateHexColor(value: string): string {
      if (!/^#[0-9a-fA-F]{6}$/.test(value)) {
        throw new RangeError(`expected #RRGGBB hex color, got ${JSON.stringify(value)}`);
      }

      return value;
    }

    /** Custom status roles, separate from the 48 standard M3 roles. */
    export const materialExtendedColorRoles = deepFreeze(#{JSON.generate(EXTENDED_ROLES)} as const);
    export type MaterialExtendedColorRole = (typeof materialExtendedColorRoles)[number];
    export type MaterialExtendedColors = Readonly<Record<MaterialExtendedColorRole, string>>;
    export type MaterialColorSchemeWithExtended = MaterialColorScheme & MaterialExtendedColors;

    export const materialColorSchemeRoles = deepFreeze([
    #{role_values}
    ] as const);

    export const materialThemePresets = deepFreeze([
    #{preset_values}
    ] as const);

    export const materialSourceColor = #{tonal_spot.fetch("sourceColor").inspect};

    export const materialThemePresetSourceColors = deepFreeze(#{ts_literal(preset_source_colors)} as const);

    export const materialThemePresetKeyColors = deepFreeze(#{ts_literal(preset_key_colors)} as const);

    export const materialThemePresetSchemes = deepFreeze(#{ts_literal(preset_schemes)} as const);

    export const lightColorScheme = deepFreeze({ ...materialThemePresetSchemes.tonalSpot.light });

    export const darkColorScheme = deepFreeze({ ...materialThemePresetSchemes.tonalSpot.dark });

    export type MaterialColorRole = (typeof materialColorSchemeRoles)[number];
    export type MaterialThemePreset = (typeof materialThemePresets)[number];
    export type MaterialThemeKeyColorRole = keyof (typeof materialThemePresetKeyColors)["tonalSpot"];
    export type MaterialThemeKeyColors = {
      readonly [Role in MaterialThemeKeyColorRole]: string;
    };
    export type MaterialColorScheme = {
      readonly [Role in MaterialColorRole]: string;
    };

    export type MaterialColorSchemeInput = Partial<Record<MaterialColorRole | MaterialExtendedColorRole, string>>;

    export interface MaterialTheme {
      readonly dark: boolean;
      readonly preset: MaterialThemePreset;
      readonly sourceColor: string;
      readonly colorScheme: MaterialColorScheme;
    }

    /** Factory theme with the eight required custom status colors. */
    export interface MaterialThemeWithExtended extends MaterialTheme {
      readonly colorScheme: MaterialColorSchemeWithExtended;
    }

    export interface MaterialThemeOptions {
      readonly dark?: boolean;
      readonly preset?: MaterialThemePreset;
      readonly colorScheme?: MaterialColorSchemeInput;
    }

    export function getMaterialThemeColorScheme(
      preset: MaterialThemePreset,
      dark = false,
    ): MaterialColorSchemeWithExtended {
      return { ...materialThemePresetSchemes[preset][dark ? "dark" : "light"] };
    }

    export function getMaterialThemeKeyColors(
      preset: MaterialThemePreset,
    ): MaterialThemeKeyColors {
      return { ...materialThemePresetKeyColors[preset] };
    }

    function mergeMaterialColorScheme(
      base: MaterialColorSchemeWithExtended,
      overrides?: MaterialColorSchemeInput,
    ): MaterialColorSchemeWithExtended {
      const colorScheme = { ...base };

      if (!overrides) {
        return colorScheme;
      }

      for (const role of [...materialColorSchemeRoles, ...materialExtendedColorRoles]) {
        const value = overrides[role];

        if (value !== undefined) {
          colorScheme[role] = validateHexColor(value);
        }
      }

      return colorScheme;
    }

    export function createMaterialTheme(options: MaterialThemeOptions = {}): MaterialThemeWithExtended {
      const dark = options.dark ?? false;
      const preset = options.preset ?? "tonalSpot";
      const base = getMaterialThemeColorScheme(preset, dark);

      return {
        dark,
        preset,
        sourceColor: materialThemePresetSourceColors[preset],
        colorScheme: mergeMaterialColorScheme(base, options.colorScheme),
      };
    }

    export function getMaterialTheme(
      preset: MaterialThemePreset,
      options: Omit<MaterialThemeOptions, "preset"> = {},
    ): MaterialThemeWithExtended {
      return createMaterialTheme({ ...options, preset });
    }

    /** Looks up a standard role without requiring custom roles on legacy schemes. */
    export function getSchemeColor(colorScheme: MaterialColorScheme, role: MaterialColorRole): string;
    /** Looks up a standard or custom role on a complete factory scheme. */
    export function getSchemeColor(colorScheme: MaterialColorSchemeWithExtended, role: MaterialColorRole | MaterialExtendedColorRole): string;
    export function getSchemeColor(
      colorScheme: MaterialColorScheme & Partial<MaterialExtendedColors>,
      role: MaterialColorRole | MaterialExtendedColorRole,
    ): string {
      // Preserve legacy undefined results for unchecked JavaScript inputs.
      return colorScheme[role] as string;
    }
  TS
end

def javascript_contrast
  <<~TS
    #{generated_header("//").rstrip}
    import type { MaterialColorScheme, MaterialExtendedColors } from "./colorScheme.js";

    /** Immutable diagnostic for an actual semantic fill/content pair. Role names are camelCase. */
    export interface MaterialContrastIssue {
      readonly colorRole: string;
      readonly onRole: string;
      readonly ratio: number;
    }

    /** WCAG 2.x ratio of opaque #RRGGBB sRGB colors. Composite translucent UI first.
     * @throws TypeError for malformed hex inputs.
     */
    export function contrastRatio(color: string, other: string): number {
      function luminance(hex: string): number {
        if (typeof hex !== "string" || hex.length !== 7 || !/^#[0-9a-fA-F]{6}$/.test(hex)) {
          throw new TypeError("expected #RRGGBB hex color");
        }
        const components = [1, 3, 5].map(offset => {
          const c = parseInt(hex.slice(offset, offset + 2), 16) / 255;
          return c <= 0.04045 ? c / 12.92 : ((c + 0.055) / 1.055) ** 2.4;
        });
        return 0.2126 * components[0]! + 0.7152 * components[1]! + 0.0722 * components[2]!;
      }
      const a = luminance(color), b = luminance(other);
      return (Math.max(a, b) + 0.05) / (Math.min(a, b) + 0.05);
    }

    const pairs = #{JSON.generate(contrast_pairs)} as const;

    /** Checks standard and present extended semantic pairs; does not infer arbitrary UI adjacency.
     * Legacy 48-role schemes omit custom pairs. If either member of a custom pair is present,
     * both must be valid hex colors. Presence uses the `in` operator, including inherited keys;
     * explicit undefined values are invalid, even when both members are undefined.
     * Unlike createMaterialTheme overrides, this validates a final scheme, not an override map.
     * Returns frozen diagnostics without mutating the scheme.
     * @throws RangeError unless minimum is finite and in 1...21; TypeError for invalid pair colors.
     */
    export function contrastIssues(
      scheme: MaterialColorScheme & Partial<MaterialExtendedColors>, minimum = 4.5,
    ): readonly MaterialContrastIssue[] {
      if (!Number.isFinite(minimum) || minimum < 1 || minimum > 21) {
        throw new RangeError("minimum must be finite and in 1...21");
      }
      const issues: MaterialContrastIssue[] = [];
      for (const [colorRole, onRole] of pairs) {
        if (#{JSON.generate(EXTENDED_ROLES)}.includes(colorRole) &&
            !(colorRole in scheme) && !(onRole in scheme)) continue;
        const ratio = contrastRatio(scheme[colorRole]!, scheme[onRole]!);
        if (ratio < minimum) issues.push(Object.freeze({ colorRole, onRole, ratio }));
      }
      return Object.freeze(issues);
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


    @dataclass(frozen=True)
    class MaterialColor:
        name: str
        hex: str

        def __post_init__(self) -> None:
            if len(self.hex) != 7 or not self.hex.startswith("#"):
                raise ValueError(f"expected #RRGGBB hex color, got {self.hex!r}")

            try:
                int(self.hex[1:], 16)
            except ValueError as error:
                raise ValueError(f"expected #RRGGBB hex color, got {self.hex!r}") from error

        def contrast_ratio(self, other: MaterialColor) -> float:
            """WCAG 2.x ratio for opaque sRGB colors; composite translucent UI first."""
            def luminance(color: MaterialColor) -> float:
                def linear(byte: int) -> float:
                    c = byte / 255
                    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4
                r, g, b = (linear(byte) for byte in color.rgb)
                return 0.2126 * r + 0.7152 * g + 0.0722 * b
            a, b = luminance(self), luminance(other)
            return (max(a, b) + 0.05) / (min(a, b) + 0.05)

        @property
        def rgb(self) -> tuple[int, int, int]:
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

    BY_NAME: dict[str, MaterialColor] = {color.name: color for color in ALL}


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

def python_theme(roles, presets)
  fields = roles.map { |role| "    #{python_role_name(role)}: MaterialColor" }.join("\n")
  role_fields = roles.map { |role| "    #{role.inspect}: #{python_role_name(role).inspect}," }.join("\n")
  enum_cases = presets.keys.map do |preset|
    "    #{python_const_name_from_camel(preset)} = #{preset.inspect}"
  end.join("\n")
  preset_schemes = presets.flat_map do |preset, data|
    [
      python_scheme(python_scheme_name(preset, "light"), "light", roles, data),
      python_scheme(python_scheme_name(preset, "dark"), "dark", roles, data)
    ]
  end.join("\n\n\n")
  source_color_values = presets.map do |preset, data|
    "    MaterialThemePreset.#{python_const_name_from_camel(preset)}: MaterialColor(\"sourceColor\", #{data.fetch("sourceColor").inspect}),"
  end.join("\n")
  key_color_values = presets.map do |preset, data|
    key_colors = data.fetch("keyColors")
    [
      "    MaterialThemePreset.#{python_const_name_from_camel(preset)}: MappingProxyType({",
      "        \"primary\": MaterialColor(\"primary\", #{key_colors.fetch("primary").inspect}),",
      "        \"secondary\": MaterialColor(\"secondary\", #{key_colors.fetch("secondary").inspect}),",
      "        \"tertiary\": MaterialColor(\"tertiary\", #{key_colors.fetch("tertiary").inspect}),",
      "        \"neutral\": MaterialColor(\"neutral\", #{key_colors.fetch("neutral").inspect}),",
      "        \"neutralVariant\": MaterialColor(\"neutralVariant\", #{key_colors.fetch("neutralVariant").inspect}),",
      "    }),"
    ].join("\n")
  end.join("\n")
  preset_scheme_values = presets.map do |preset, _data|
    const_name = "MaterialThemePreset.#{python_const_name_from_camel(preset)}"
    "    #{const_name}: MappingProxyType({\"light\": #{python_scheme_name(preset, "light")}, \"dark\": #{python_scheme_name(preset, "dark")}}),"
  end.join("\n")

  <<~PYTHON
    #{generated_header("#").rstrip}
    from __future__ import annotations

    from collections.abc import Mapping
    from dataclasses import dataclass, field
    from enum import Enum
    from math import isfinite
    from types import MappingProxyType
    from typing import Optional, Union

    from .colors import MaterialColor


    COLOR_SCHEME_ROLES: tuple[str, ...] = (
    #{roles.map { |role| "    #{role.inspect}," }.join("\n")}
    )

    ROLE_FIELDS: dict[str, str] = {
    #{role_fields}
    }


    class MaterialThemePreset(str, Enum):
    #{enum_cases}


    EXTENDED_COLOR_ROLES: tuple[str, ...] = (
    #{EXTENDED_ROLES.map { |role| "    #{role.inspect}," }.join("\n")}
    )
    EXTENDED_COLOR_SCHEMES = MappingProxyType({
    #{%w[light dark].map { |mode| "    #{mode.inspect}: MappingProxyType({" + EXTENDED.fetch(mode).map { |r,h| "#{r.inspect}: MaterialColor(#{r.inspect}, #{h.inspect})" }.join(", ") + "})," }.join("\n")}
    })

    @dataclass(frozen=True)
    class MaterialContrastIssue:
        """Diagnostic value with camelCase role names and an unrounded ratio.

        Fields are stored verbatim; construction does not measure colors or validate roles.
        """
        color_role: str
        on_role: str
        ratio: float


    _CONTRAST_PAIRS = (
    #{contrast_pairs.map { |a,b| "    (#{a.inspect}, #{b.inspect})," }.join("\n")}
    )

    @dataclass(frozen=True)
    class MaterialColorScheme:
        appearance: str
    #{fields}
        extended_colors: Optional[Mapping[str, MaterialColor]] = field(default=None, hash=False)

        def __post_init__(self) -> None:
            if self.appearance not in ("light", "dark"):
                raise ValueError(f"appearance must be 'light' or 'dark', got {self.appearance!r}")
            base = dict(EXTENDED_COLOR_SCHEMES[self.appearance])
            if self.extended_colors is not None:
                for role, color in self.extended_colors.items():
                    if role not in EXTENDED_COLOR_ROLES:
                        raise ValueError(f"unknown extended role: {role}")
                    if not isinstance(color, MaterialColor):
                        raise TypeError("extended colors must be MaterialColor instances")
                    base[role] = color
            object.__setattr__(self, "extended_colors", MappingProxyType(base))

    #{EXTENDED_ROLES.map { |r| "    @property\n    def #{python_role_name(r)}(self) -> MaterialColor:\n        \"\"\"Harmonized custom status color, outside the standard M3 roles.\"\"\"\n        return self.extended_colors[#{r.inspect}]\n" }.join("\n")}

        def role_color(self, role: str) -> MaterialColor:
            return self.extended_colors[role] if role in EXTENDED_COLOR_ROLES else getattr(self, ROLE_FIELDS[role])

        def contrast_issues(self, minimum: float = 4.5) -> tuple[MaterialContrastIssue, ...]:
            """Check standard and extended semantic pairs, not arbitrary UI adjacency.

            Raises ValueError unless minimum is finite and in 1...21. No clamping.
            """
            # Compare before float conversion: Python integers may exceed float range.
            if not 1 <= minimum <= 21 or not isfinite(minimum):
                raise ValueError("minimum must be finite and in 1...21")
            issues = []
            for color_role, on_role in _CONTRAST_PAIRS:
                ratio = self.role_color(color_role).contrast_ratio(self.role_color(on_role))
                if ratio < minimum:
                    issues.append(MaterialContrastIssue(color_role, on_role, ratio))
            return tuple(issues)

        def as_hex_map(self) -> dict[str, str]:
            """Map of camelCase role name to ``#RRGGBB`` hex. Not a round-trip
            of the dataclass: fields are snake_case ``MaterialColor`` instances."""
            return {role: self.role_color(role).hex for role in COLOR_SCHEME_ROLES}

        def as_extended_hex_map(self) -> dict[str, str]:
            """Export all standard AND custom roles for a lossless color-value round trip."""
            return {role: self.role_color(role).hex for role in (*COLOR_SCHEME_ROLES, *EXTENDED_COLOR_ROLES)}


    #{preset_schemes}


    PRESET_SOURCE_COLORS: Mapping[MaterialThemePreset, MaterialColor] = MappingProxyType({
    #{source_color_values}
    })


    PRESET_KEY_COLORS: Mapping[MaterialThemePreset, Mapping[str, MaterialColor]] = MappingProxyType({
    #{key_color_values}
    })


    PRESET_COLOR_SCHEMES: Mapping[MaterialThemePreset, Mapping[str, MaterialColorScheme]] = MappingProxyType({
    #{preset_scheme_values}
    })


    MATERIAL_SOURCE_COLOR = PRESET_SOURCE_COLORS[MaterialThemePreset.TONAL_SPOT]


    @dataclass(frozen=True)
    class MaterialTheme:
        color_scheme: MaterialColorScheme
        source_color: Optional[MaterialColor] = MATERIAL_SOURCE_COLOR
        preset: Optional[MaterialThemePreset] = None


    LIGHT_COLOR_SCHEME = #{python_scheme_name("tonalSpot", "light")}
    DARK_COLOR_SCHEME = #{python_scheme_name("tonalSpot", "dark")}


    def _coerce_preset(preset: Union[MaterialThemePreset, str]) -> MaterialThemePreset:
        if isinstance(preset, MaterialThemePreset):
            return preset
        return MaterialThemePreset(preset)


    def preset_color_scheme(
        preset: Union[MaterialThemePreset, str],
        dark: bool = False,
    ) -> MaterialColorScheme:
        material_preset = _coerce_preset(preset)
        return PRESET_COLOR_SCHEMES[material_preset]["dark" if dark else "light"]


    def preset_key_colors(preset: Union[MaterialThemePreset, str]) -> dict[str, MaterialColor]:
        return dict(PRESET_KEY_COLORS[_coerce_preset(preset)])


    def baseline_color_scheme(dark: bool = False) -> MaterialColorScheme:
        return preset_color_scheme(MaterialThemePreset.TONAL_SPOT, dark)


    def custom_color_scheme(
        overrides: Mapping[str, Optional[str]],
        dark: bool = False,
        preset: Union[MaterialThemePreset, str] = MaterialThemePreset.TONAL_SPOT,
    ) -> MaterialColorScheme:
        base = preset_color_scheme(preset, dark)
        values = {}

        for role in COLOR_SCHEME_ROLES:
            field = ROLE_FIELDS[role]
            hex_value = overrides.get(role)
            values[field] = MaterialColor(role, hex_value) if hex_value is not None else getattr(base, field)

        extended = {
            role: MaterialColor(role, overrides[role])
            for role in EXTENDED_COLOR_ROLES if overrides.get(role) is not None
        }
        return MaterialColorScheme(appearance=base.appearance, extended_colors=extended, **values)


    def material_theme_builder_color_scheme(
        appearance: str,
        roles: Mapping[str, str],
    ) -> MaterialColorScheme:
        missing_roles = [role for role in COLOR_SCHEME_ROLES if role not in roles]

        if missing_roles:
            raise ValueError("missing Material color roles: " + ", ".join(missing_roles))

        values = {
            ROLE_FIELDS[role]: MaterialColor(role, roles[role])
            for role in COLOR_SCHEME_ROLES
        }
        extended = {role: MaterialColor(role, roles[role]) for role in EXTENDED_COLOR_ROLES if role in roles}
        return MaterialColorScheme(appearance=appearance, extended_colors=extended, **values)


    def create_theme(
        dark: bool = False,
        color_scheme: Optional[Union[MaterialColorScheme, Mapping[str, Optional[str]]]] = None,
        preset: Union[MaterialThemePreset, str] = MaterialThemePreset.TONAL_SPOT,
    ) -> MaterialTheme:
        material_preset = _coerce_preset(preset)
        if color_scheme is None:
            material_color_scheme = preset_color_scheme(material_preset, dark)
            source_color = PRESET_SOURCE_COLORS[material_preset]
            theme_preset = material_preset
        elif isinstance(color_scheme, MaterialColorScheme):
            material_color_scheme = color_scheme
            source_color = None
            theme_preset = None
        else:
            material_color_scheme = custom_color_scheme(color_scheme, dark=dark, preset=material_preset)
            source_color = None
            theme_preset = None

        return MaterialTheme(
            color_scheme=material_color_scheme,
            source_color=source_color,
            preset=theme_preset,
        )


    def get_theme(preset: Union[MaterialThemePreset, str], dark: bool = False) -> MaterialTheme:
        return create_theme(dark=dark, preset=preset)
  PYTHON
end

def dynamic_theme_adapter(platform)
  appkit = platform == "AppKit"
  color = appkit ? "NSColor" : "UIColor"
  native_property = appkit ? "nsColor" : "uiColor"
  condition = appkit ? 'appearance.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua' : 'trait.userInterfaceStyle == .dark'
  provider = appkit ? 'NSColor(name: nil) { appearance in' : 'UIColor { trait in'
  <<~SWIFT
    #{generated_header("//").rstrip}
    #if canImport(#{platform})
    import #{platform}
    import MaterialDesignColorCore

    public extension #{color} {
      /// Resolves a role from final app-owned light/dark themes for the native appearance.
      /// Both standard and extended roles are supported via a scheme key path.
      /// Example: `#{color}.material(light: pair.light, dark: pair.dark, \\.warning)`.
      static func material(light: MaterialTheme, dark: MaterialTheme,
                           _ role: KeyPath<MaterialColorScheme, MaterialColor>) -> #{color} {
        #{provider}
          let isDark = #{condition}
          return (isDark ? dark : light).colorScheme[keyPath: role].#{native_property}
        }
      }
    }
    #endif
  SWIFT
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
material3_presets = JSON.parse(File.read(MATERIAL3_PRESETS_PATH)).reject { |key, _| key.start_with?("$") }

EXTENDED = JSON.parse(File.read(File.join(ROOT, "tokens/material3/extended-color-schemes.json")))
validate_extended_tokens(EXTENDED)
EXTENDED_ROLES = EXTENDED.fetch("light").keys
validate_material2_tokens(material2_tokens)
validate_material3_tokens(material3_roles, material3_baseline, material3_presets)
clashes = EXTENDED_ROLES & material3_roles
abort("extended roles collide with standard roles: #{clashes.join(", ")}") unless clashes.empty?
# These names occupy generated enum/scheme namespaces, including Python normalization.
reserved_members = %w[appearance extendedColors overridingExtended overriding color roleColor asHexMap asExtendedHexMap
  contrastIssues validatedContrastIssues custom preset baseline baselineLight baselineDark values rawValue allCases hash hashValue
  description init deinit self super Self Type Protocol get set willSet didSet subscript
  associatedtype class enum extension fileprivate func import inout internal let open operator private
  precedencegroup protocol public rethrows static struct typealias var break case catch continue default
  defer do else fallthrough for guard if in repeat return throw switch where while as any false is nil
  some throws true try async await actor nonisolated isolated borrowing consuming consume copy sending
  package final override required convenience lazy weak unowned mutating nonmutating dynamic indirect
  and assert def del elif except finally from global lambda nonlocal not or pass raise with yield match]
reserved_members += material3_presets.keys.flat_map { |preset| %w[light dark].map { |mode| swift_static_name(preset, mode) } }
reserved_normalized = reserved_members.map { |name| python_role_name(name) }
reserved = EXTENDED_ROLES.select { |role| reserved_members.include?(role) || reserved_normalized.include?(python_role_name(role)) }
abort("extended roles collide with reserved members: #{reserved.join(', ')}") unless reserved.empty?
normalized = (material3_roles + EXTENDED_ROLES).group_by { |role| python_role_name(role) }
duplicates = normalized.select { |_name, roles| roles.size > 1 }
abort("role names collide after Python normalization: #{duplicates.values.flatten.join(', ')}") unless duplicates.empty?


write_file(
  "packages/ios/Sources/MaterialDesignColorCore/MaterialDesignColor.swift",
  swift_core(material2_tokens, material3_roles, material3_presets),
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
write_file("packages/js/src/contrast.ts", javascript_contrast, check: check)
write_file(
  "packages/js/src/colors.ts",
  react_native_colors(material2_tokens),
  check: check
)
write_file(
  "packages/js/src/colorScheme.ts",
  react_native_color_scheme(material3_roles, material3_presets),
  check: check
)
write_file(
  "packages/python/src/material_design_color/colors.py",
  python_colors(material2_tokens),
  check: check
)
write_file(
  "packages/python/src/material_design_color/theme.py",
  python_theme(material3_roles, material3_presets),
  check: check
)

%w[AppKit UIKit].each do |platform|
  color = platform == "AppKit" ? "NSColor" : "UIColor"
  write_file("packages/ios/Sources/MaterialDesignColor#{platform}/#{color}+MaterialTheme.swift",
             dynamic_theme_adapter(platform), check: check)
end

exit(1) if check && $out_of_date
