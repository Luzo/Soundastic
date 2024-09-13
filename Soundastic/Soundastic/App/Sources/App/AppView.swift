import Components
import Home
import Login
import Resolver
import SwiftUI
import Theme

public struct AppView<Reducer: AppReducerDefinition>: View {
  @InjectedObject var appReducer: Reducer

  public init() {}

  public var body: some View {
    NavigationStack {
      ProgressView()
        .navigationDestination(
          isPresented: .constant(appReducer.state.isLoggedIn)
        ) {
          if appReducer.state.isLoggedIn {
            HomeView<HomeReducer>()
          } else {
            LoginView<LoginReducer>()
          }
        }

      Button("checkLogin") {
        appReducer.checkLogin()
      }
    }
  }
}

#Preview {
  AppView<AppReducer>()
}
