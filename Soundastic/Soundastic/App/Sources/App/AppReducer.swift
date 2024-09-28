import Core
import Combine
import Login
import Resolver
import SwiftUI

public protocol AppReducerDefinition: AppReducerAction, ObservableObject {
  var state: AppReducer.State { get }
}

public protocol AppReducerAction {
  func writeContents()
}

extension AppReducer {
  public struct State: StateInitiable {
    var isLoginPresented: Bool = false
    var isHomePresented: Bool = false
    var loadingText: String = ""

    public init() {}
  }
}

public class AppReducer: Reducer<AppReducer.State>, AppReducerDefinition {
  @Injected var loginSharedStore: LoginSharedStoreDefinition
  @Injected var navigationReducer: NavigationReducer
  
  public override func cancellablesToRegister() -> [AnyCancellable] {
    let observeLogin = loginSharedStore.loggedIn
      .combineLatest(loginSharedStore.isLoginInProgress)
      .receive(on: DispatchQueue.main)
      .delay(for: 3, scheduler: DispatchQueue.main)
      .first()
      .sink { [weak self] isLoggedIn, isLoginInProgress in
        guard !isLoginInProgress else { return }
        self?.navigationReducer.navigateTo(isLoggedIn ? .home : .login)
      }

    return [
      observeLogin
    ]
  }

  public func writeContents() {
    print(loginSharedStore.text)
  }
}
