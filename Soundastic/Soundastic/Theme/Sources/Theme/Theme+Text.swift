import SwiftUI

public extension Theme.Color.Text {
  var color: Color {
    switch self {
    case .main:
      return Color(.Text.main)
    }
  }
}
