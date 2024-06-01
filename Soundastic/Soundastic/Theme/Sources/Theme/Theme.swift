// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

public enum Theme {
  public enum Color {
    public enum Background {
      case main
    }
  }
}

public extension Theme.Color.Background {
  var color: Color {
    switch self {
    case .main:
      return .yellow
    }
  }
}
