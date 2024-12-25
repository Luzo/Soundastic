import Combine
import Resolver
import SwiftUI

public protocol NavigationReducerDefinition: ObservableObject where UseCase: NavigationUseCase {
  associatedtype UseCase: NavigationUseCase
  var state: NavigationReducer<UseCase>.State { get }

  func navigateTo(_ useCase: UseCase, addingParentUseCases: Bool)
}

public extension NavigationReducerDefinition {
  func navigateTo(_ useCase: UseCase) {
    navigateTo(useCase, addingParentUseCases: false)
  }
}

public protocol NavigationUseCase: Equatable, Hashable {
  var parentUseCases: [Self] { get }
}

extension NavigationReducer {
  public struct State: StateInitiable {
    public var navPath: NavigationPath = .init()

    public init() {}
  }
}

open class NavigationReducer<
  UseCase: NavigationUseCase
>: Reducer<NavigationReducer.State>, NavigationReducerDefinition {

  open func navigateTo(_ useCase: UseCase, addingParentUseCases: Bool) {
    if addingParentUseCases {
      useCase.parentUseCases.forEach {
        state.navPath.append($0)
      }
    }

    state.navPath.append(useCase)
  }
}

public extension NavigationReducer {

  func navigateBack() {
    state.navPath.removeLast()
  }

  func navigateToRoot() {
    state.navPath.removeLast(state.navPath.count)
  }
}
