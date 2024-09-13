import SwiftUI

public extension Theme.Color.Background {
  var color: Color {
    switch self {
    case .main:
      return Color(.Background.main)
    case .outline:
      return Color(.Background.outline)
    }
  }
}
