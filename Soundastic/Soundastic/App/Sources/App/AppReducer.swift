import Core
import Resolver
import SwiftUI

public protocol AppReducerDefinition: AppReducerAction, ObservableObject {
  var state: AppReducer.State { get }
}

public protocol AppReducerAction {
  func checkLogin()
  func logoutCalled()
}

extension AppReducer {
  enum Route {
    case home
    case login
  }
}

extension AppReducer {
  public struct State {
    var timestampInit: Date
    var isLoggedIn: Bool

    init(isLoggedIn: Bool) {
      @Injected var systemDependenciesProvider: SystemDependenciesProviderDefinition
      timestampInit = systemDependenciesProvider.now
      self.isLoggedIn = isLoggedIn
    }
  }
}

public class AppReducer: AppReducerDefinition {
  @Published public var state: State

  init() {
    self.state = .init(isLoggedIn: false)
    checkLogin()
  }
}


public extension AppReducer {
  func checkLogin() {
   let checkIfLoggedIn = Task {
     let date = Date()
     let secondsPassed = date.timeIntervalSince(state.timestampInit)
     return secondsPassed > 5
   }

    Task { @MainActor [unowned self] in
      self.state.isLoggedIn = await checkIfLoggedIn.value
    }
  }

  func logoutCalled() {
    @Injected var systemDependenciesProvider: SystemDependenciesProviderDefinition
    state.timestampInit = systemDependenciesProvider.now
    state.isLoggedIn = false
  }
}
