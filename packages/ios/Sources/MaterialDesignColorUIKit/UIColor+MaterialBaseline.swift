#if canImport(UIKit)
import MaterialDesignColorCore
import UIKit

public extension UIColor {
  /// 트레이트 컬렉션의 `userInterfaceStyle` 에 따라 M3 베이스라인 light / dark
  /// 스킴 사이를 자동 전환하는 `UIColor` 를 반환한다.
  ///
  /// ```swift
  /// view.backgroundColor = .materialBaseline(\.primary)
  /// ```
  ///
  /// 베이스라인이 아닌 커스텀 `MaterialColorScheme` 쌍을 쓰려면
  /// `UIColor(dynamicProvider:)` 와 `MaterialColor` 기반의
  /// `UIColor(materialColor:)` 이니셜라이저를 직접 조합하면 된다.
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, *)
  static func materialBaseline(_ role: KeyPath<MaterialColorScheme, MaterialColor>) -> UIColor {
    UIColor { trait in
      let materialColor = trait.userInterfaceStyle == .dark
        ? MaterialColorScheme.baselineDark[keyPath: role]
        : MaterialColorScheme.baselineLight[keyPath: role]
      return UIColor(materialColor: materialColor)
    }
  }
}
#endif
