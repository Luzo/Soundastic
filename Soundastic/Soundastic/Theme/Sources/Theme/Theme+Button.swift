import SwiftUI

public extension Theme.Style.Button {
  var backgroundColor: Theme.Color.Background {
    switch self {
    case .main:
      return Theme.Color.Background.main
    }
  }

  var outlineColor: Theme.Color.Background {
    switch self {
    case .main:
      return Theme.Color.Background.outline
    }
  }

  var textColor: Theme.Color.Text {
    switch self {
    case .main:
      return Theme.Color.Text.main
    }
  }

  var paddingHorizontal: CGFloat {
    switch self {
    case .main:
      return 20
    }
  }

  var paddingVertical: CGFloat {
    switch self {
    case .main:
      return 10
    }
  }

  var fixedPercentage: CGFloat {
    switch self {
    case .main:
      return 0.6
    }
  }
}
