import Core
import Home
import Login
import Resolver

public extension Resolver {
  static func registerAppDependencies() {
    register { AppReducer() }

    register { AppNavigationReducer() }
      .implements(NavigationReducer<AppNavigationUseCase>.self)
      .implements(HomeOutboundNavigationReducerDefinition.self)
      .implements(LoginOutboundNavigationReducerDefinition.self)
      .scope(.container)
  }
}
