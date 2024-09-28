import Components
import Resolver
import SwiftUI
import Theme

public struct LoginView<Reducer: LoginReducerDefinition>: View {
  @InjectedObject var loginReducer: Reducer

  public init() {}

  public var body: some View {
    VStack(alignment: .center) {
      if !loginReducer.state.isLoading {
        StylableButton(.constant("Login"), style: .main) {
          loginReducer.login()
        }
      } else {
        ProgressView()
      }
    }
    .padding()
    .background(Theme.Color.Background.main.color)
    .navigationBarBackButtonHidden()
  }
}

#Preview {
  LoginView<LoginReducer>()
}
