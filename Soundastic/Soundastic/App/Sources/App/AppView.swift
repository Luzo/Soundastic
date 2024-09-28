import Components
import Core
import Home
import Login
import Resolver
import SwiftUI
import Theme

public struct AppView<Reducer: AppReducerDefinition>: View {
  @InjectedObject var appReducer: Reducer
  @InjectedObject var navigationReducer: NavigationReducer

  public init() {}

  public var body: some View {
    NavigationStack(path: $navigationReducer.state.navPath) {
      ProgressView()
        .onAppear {
          appReducer.writeContents()
        }
        .navigationDestination(for: NavigationUseCase.self) { destination in
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
