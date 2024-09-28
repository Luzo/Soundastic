import Components
import Resolver
import SwiftUI
import Theme

public struct HomeView<Reducer: HomeReducerDefinition>: View {
  @InjectedObject var homeReducer: Reducer

  public init() {}

  public var body: some View {
    VStack(alignment: .center) {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(Color.blue)
      Text("Hello, world!")
      StylableButton(.constant(homeReducer.state.text), style: .main) {
        homeReducer.changeText()
      }
    }
    .padding()
    .background(Theme.Color.Background.main.color)
    .backButton(.constant("Home")) {
      homeReducer.logout()
    }
  }
}

#Preview {
  HomeView<HomeReducer>()
}
