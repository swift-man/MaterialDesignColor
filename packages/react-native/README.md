# MaterialDesignColor for React Native and Expo

This package is pure TypeScript and does not require native modules, config plugins, or an Expo prebuild.

Material 3 style role colors:

```ts
import { createMaterialTheme } from "@swift-man/material-design-color";

const theme = createMaterialTheme({ dark: false });
const primary = theme.colorScheme.primary;
```

```ts
import { colors } from "@swift-man/material-design-color";

const backgroundColor = colors.pink400;
```

```tsx
import { colors } from "@swift-man/material-design-color";

export function Example() {
  return <View style={{ backgroundColor: colors.tealA700 }} />;
}
```
