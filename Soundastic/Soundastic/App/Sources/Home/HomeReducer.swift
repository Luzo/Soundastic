import SwiftUI

public protocol HomeReducerDefinition: HomeReducerAction, ObservableObject {
  var state: HomeReducer.State { get }
}

public protocol HomeReducerAction {
  func changeText()
}

extension HomeReducer {
  public struct State {
    var text: String

    init(text: String) {
      self.text = text
    }
  }
}

public class HomeReducer: HomeReducerDefinition {
  @Published public var state: State

  public init() {
    self.state = .init(text: "Tap me")
  }
}

public extension HomeReducer {
  func changeText() {
    state.text = [
      "abc",
      "def",
      "gh"
    ].randomElement() ?? ""
  }
}
