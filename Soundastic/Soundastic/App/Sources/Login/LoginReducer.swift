import Core
import Resolver
import SwiftUI

public protocol LoginReducerDefinition: LoginReducerAction, ObservableObject {
  var state: LoginReducer.State { get }
}

public protocol LoginReducerAction {
  func login()
}

extension LoginReducer {
  public struct State: StateInitiable {
    var isLoading: Bool = false

    public init() {}
  }
}

public class LoginReducer: Reducer<LoginReducer.State>, LoginReducerDefinition {
  @Injected var loginSharedStore: LoginSharedStoreDefinition
  @Injected var navigationReducer: NavigationReducer
}

@MainActor
public extension LoginReducer {
  func login() {
    state.isLoading = true
    Task {
      try await Task.sleep(for: .seconds(3))

      await MainActor.run {
        state.isLoading = false
        navigationReducer.navigateTo(.home)
      }
    }
  }
}
