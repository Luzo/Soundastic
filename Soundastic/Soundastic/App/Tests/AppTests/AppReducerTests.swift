@testable import App
@testable import Login

import Core
import Resolver
import Testing

struct AppTests {
  @Test
  func navigateToLogin() async throws {
    let appNavigation: AppNavigationSpy = AppNavigationSpy()
    Resolver.main.registerForTests(appNavigation: appNavigation)
    let appReducer: AppReducer = Resolver.main.resolve()
    appReducer.loginSharedStore.isLoginInProgress.send(false)
    appReducer.loginSharedStore.loggedIn.send(false)

    try await Task.sleep(for: .seconds(1))
    #expect(appNavigation.navigations == [.login])
  }
}

final class AppNavigationSpy: NavigationReducer<AppNavigationUseCase> {
  var navigations: [AppNavigationUseCase] = []

  override func navigateTo(_ useCase: AppNavigationUseCase, addingParentUseCases: Bool) {
    navigations.append(useCase)
  }
}

private extension Resolver {
  func registerForTests( appNavigation: AppNavigationSpy) {
    register { appNavigation as NavigationReducer<AppNavigationUseCase> }
    register { LoginSharedStore() as LoginSharedStoreDefinition }
    register { AppReducer() }
  }
}
