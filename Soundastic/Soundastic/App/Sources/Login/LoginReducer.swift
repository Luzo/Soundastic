import SwiftUI

public protocol LoginReducerDefinition: LoginReducerAction, ObservableObject {
  var state: LoginReducer.State { get }
}

public protocol LoginReducerAction {
  func changeText()
}

extension LoginReducer {
  public struct State {
    var text: String

    init(text: String) {
      self.text = text
    }
  }
}

public class LoginReducer: LoginReducerDefinition {
  @Published public var state: State

  public init() {
    self.state = .init(text: "Tap me")
  }
}

public extension LoginReducer {
  func changeText() {
    state.text = [
      "abc",
      "def",
      "gh"
    ].randomElement() ?? ""
  }
}
