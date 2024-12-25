import Components
import Core
import Home
import Login
import Resolver
import SwiftUI
import Theme

public struct AppView<Reducer: AppReducerDefinition>: View {
  @InjectedObject var appReducer: Reducer
  @InjectedObject var appNavigationReducer: NavigationReducer<AppNavigationUseCase>

  public init() {}

  public var body: some View {
    NavigationStack(path: $appNavigationReducer.state.navPath) {
      ProgressView()
        .onAppear {
          appReducer.writeContents()
        }
        .navigationDestination(for: AppNavigationUseCase.self) { destination in
          switch destination {
          case .home:
            HomeView<HomeReducer>()

          case .login:
            LoginView<LoginReducer>()
          }
        }
    }
  }
}

#Preview {
  AppView<AppReducer>()
}
