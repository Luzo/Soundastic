import Core
import Resolver
import SwiftUI

public protocol LoginReducerDefinition: LoginReducerAction, ObservableObject {
  var state: LoginReducer.State { get }
}

public protocol LoginReducerAction {
  func login() async
}

extension LoginReducer {
  public struct State: StateInitiable {
    var isLoading: Bool = false

    public init() {}
  }
}

public class LoginReducer: Reducer<LoginReducer.State>, LoginReducerDefinition {
  @Injected var loginSharedStore: LoginSharedStoreDefinition
  @Injected var outboundNavigationReducer: LoginOutboundNavigationReducerDefinition
}

@MainActor
extension LoginReducer: LoginReducerAction {
  public func login() async {
    state.isLoading = true
    Task {
      try await Task.sleep(for: .seconds(1))

      await MainActor.run {
        state.isLoading = false
        outboundNavigationReducer.navigateTo(.loginSuccess)
      }
    }
  }
}
