import Combine
import Resolver
import SwiftUI

// TODO: NAVGIATION REFACTOR
// Form the NavigationStacks implementation it seems quite better
// to just use Navigation reducer for each stack + one navigation reducer for whole app.
// This seems to allow deeplinking and some other wild navigations.
public protocol NavigationReducerDefinition: NavigationReducerAction, ObservableObject {
  var state: NavigationReducer.State { get }
}

public protocol NavigationReducerAction {
  func navigateTo(_ useCase: NavigationUseCase, addingParentUseCases: Bool)
}

public extension NavigationReducerAction {
  func navigateTo(_ useCase: NavigationUseCase) {
    navigateTo(useCase, addingParentUseCases: false)
  }
}

public enum NavigationUseCase {
  case login
  case home
}

extension NavigationReducer {
  public struct State: StateInitiable {
    public var navPath: NavigationPath = .init()

    public init() {}
  }
}

public class NavigationReducer: Reducer<NavigationReducer.State>, NavigationReducerDefinition {
}

public extension NavigationReducer {
  func navigateTo(_ useCase: NavigationUseCase, addingParentUseCases: Bool) {
    if addingParentUseCases {
      useCase.parentUseCases.forEach {
        state.navPath.append($0)
      }
    }

    state.navPath.append(useCase)
  }

  func navigateBack() {
    state.navPath.removeLast()
  }

  func navigateToRoot() {
    state.navPath.removeLast(state.navPath.count)
  }
}

private extension NavigationUseCase {
  var parentUseCases: [NavigationUseCase] {
    switch self {
    case .login:
      return []
    case .home:
      return []
    }
  }
}
