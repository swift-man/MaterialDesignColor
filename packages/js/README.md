# MaterialDesignColor for JavaScript / TypeScript

Material Design 3 preset color schemes (light/dark, 48 roles) and the classic Material 2 palette as plain TypeScript constants.

This package is **framework-agnostic** — pure TS with no runtime dependencies. Works in:
- **React Native / Expo** (Metro consumes the published `dist/` ESM output)
- Plain React, Vue, Svelte, vanilla web
- Node.js (ESM, 16+), Deno, Bun

The package is published as **ESM-only** (`"type": "module"`). CommonJS consumers can use a dynamic `await import("@swift-man/material-design-color")` or migrate to ESM. No native modules, no Expo config plugins, no prebuild required.

## Install

```bash
npm install @swift-man/material-design-color
# or
yarn add @swift-man/material-design-color
# or
pnpm add @swift-man/material-design-color
```

## Usage

### Material 3 preset color schemes

```ts
import { createMaterialTheme, getMaterialThemeKeyColors } from "@swift-man/material-design-color";

const theme = createMaterialTheme({ preset: "expressive", dark: false });
const primary = theme.colorScheme.primary;          // "#006B5A"
const onPrimaryContainer = theme.colorScheme.onPrimaryContainer;
const keyPrimary = getMaterialThemeKeyColors("expressive").primary;
```

Available presets: `tonalSpot`, `fidelity`, `content`, `monochrome`, `neutral`, `vibrant`, `expressive`, `rainbow`, `fruitSalad`.

### Material Theme Builder color schemes

Paste role colors from Material Theme Builder into `colorScheme`. Missing roles fall back to the selected preset.

```ts
import { createMaterialTheme } from "@swift-man/material-design-color";

const theme = createMaterialTheme({
  preset: "tonalSpot",
  colorScheme: {
    primary: "#6750A4",
    onPrimary: "#FFFFFF",
    primaryContainer: "#EADDFF",
    onPrimaryContainer: "#21005D",
    surface: "#FFFBFE",
    onSurface: "#1C1B1F",
  },
});
```

### Material 2 palette

```ts
import { colors } from "@swift-man/material-design-color";

const backgroundColor = colors.pink400;             // "#EC407A"
const accent = colors.tealA700;                     // "#00BFA5"
```

### React Native / Expo

```tsx
import { createMaterialTheme, colors } from "@swift-man/material-design-color";
import { View, Text } from "react-native";

const theme = createMaterialTheme({ preset: "fruitSalad", dark: true });

export function Example() {
  return (
    <View style={{ backgroundColor: theme.colorScheme.surface }}>
      <Text style={{ color: theme.colorScheme.onSurface }}>Hello</Text>
      <View style={{ backgroundColor: colors.tealA700 }} />
    </View>
  );
}
```

### Plain web

```ts
import { getMaterialTheme } from "@swift-man/material-design-color";

document.body.style.backgroundColor = getMaterialTheme("neutral").colorScheme.surface;
```

### Node / Deno / Bun

```ts
import { colors, lightColorScheme } from "@swift-man/material-design-color";

console.log(colors.blue500);              // "#2196F3"
console.log(lightColorScheme.primary);    // "#65558F"
```

## Cross-language consistency

The hex values here are generated from the same JSON tokens as the iOS Swift package and the Python package, so a `colors.pink400` in your RN app is byte-identical to `MaterialPalette.pink400` on iOS and `colors.pink400` in Python. Useful when you ship the same product across stacks.
