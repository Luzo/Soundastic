import Core
import Home
import Login

public extension AppNavigationUseCase {
  var parentUseCases: [Self] {
    switch self {
    case .login:
      return []
    case .home:
      return []
    }
  }
}

public enum AppNavigationUseCase: NavigationUseCase {
  case login
  case home
}

final class AppNavigationReducer: NavigationReducer<AppNavigationUseCase> {}

extension AppNavigationReducer: HomeOutboundNavigationReducerDefinition {
  func navigateTo(_ useCase: HomeOutboundNavigationUseCase) {
    switch useCase {
    case .logout:
      navigateTo(.login)
    }
  }
}

extension AppNavigationReducer: LoginOutboundNavigationReducerDefinition {
  func navigateTo(_ useCase: LoginOutboundNavigationUseCase) {
    switch useCase {
    case .loginSuccess:
      navigateTo(.home)
    }
  }
}
