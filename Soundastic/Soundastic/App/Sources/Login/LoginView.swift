import Components
import Resolver
import SwiftUI
import Theme

public struct LoginView<Reducer: LoginReducerDefinition>: View {
  @InjectedObject var loginReducer: Reducer

  public init() {}

  public var body: some View {
    VStack(alignment: .center) {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(Color.blue)
      Text("Login!")
      StylableButton(.constant(loginReducer.state.text), style: .main) {
        loginReducer.changeText()
      }
    }
    .padding()
    .background(Theme.Color.Background.main.color)
  }
}

#Preview {
  LoginView<LoginReducer>()
}
