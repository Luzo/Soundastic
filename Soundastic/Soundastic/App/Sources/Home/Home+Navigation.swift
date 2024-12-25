import Core

public extension HomeNavigationUseCase {
  var parentUseCases: [Self] {
    return []
  }
}

public enum HomeNavigationUseCase: NavigationUseCase {
}

final class HomeNavigationReducer: NavigationReducer<HomeNavigationUseCase> {}

public enum HomeOutboundNavigationUseCase {
  case logout
}

public protocol HomeOutboundNavigationReducerDefinition {
  func navigateTo(_ useCase: HomeOutboundNavigationUseCase)
}
