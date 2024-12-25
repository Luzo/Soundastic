import Core

public extension LoginNavigationUseCase {
  var parentUseCases: [Self] {
    return []
  }
}

public enum LoginNavigationUseCase: NavigationUseCase {
}

final class LoginNavigationReducer: NavigationReducer<LoginNavigationUseCase> {}

public enum LoginOutboundNavigationUseCase {
  case loginSuccess
}

public protocol LoginOutboundNavigationReducerDefinition {
  func navigateTo(_ useCase: LoginOutboundNavigationUseCase)
}
