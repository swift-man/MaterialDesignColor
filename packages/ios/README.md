# MaterialDesignColor for iOS

Swift Package Manager reads the root `Package.swift`. The iOS source lives in this folder and is exposed through these products:

| Product | Purpose |
| --- | --- |
| `MaterialDesignColor` | Backward-compatible SwiftUI product |
| `MaterialDesignColorCore` | Pure Swift color token model |
| `MaterialDesignColorSwiftUI` | `SwiftUI.Color` extensions |
| `MaterialDesignColorUIKit` | `UIKit.UIColor` extensions |

```swift
import SwiftUI
import MaterialDesignColorSwiftUI

let color: Color = .pink400
```

```swift
import UIKit
import MaterialDesignColorUIKit

let color: UIColor = .pink400
```

Material 3 style role colors are exposed through `MaterialTheme` and `MaterialColorScheme`.

```swift
import MaterialDesignColorSwiftUI

let theme = MaterialTheme.light

Text("Hello")
  .foregroundStyle(theme.colorScheme.primary.color)
  .background(theme.colorScheme.surface.color)
```

```swift
import MaterialDesignColorUIKit

let scheme = MaterialColorScheme.baseline(.dark)

label.textColor = scheme.onSurface.uiColor
view.backgroundColor = scheme.surface.uiColor
```
