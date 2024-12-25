import Components
import Resolver
import SwiftUI
import Theme

public struct HomeView<Reducer: HomeReducerDefinition>: View {
  @InjectedObject var homeReducer: Reducer

  public init() {}

  public var body: some View {
    VStack(alignment: .center, spacing: .Inset.section) {
      VStack(spacing: .Inset.group) {
        Rectangle()
          .containerRelativeFrame([ .vertical]) { size, axis in
            size * 0.3
          }
          .padding(.horizontal, .Inset.basic)
          .background(.black)

        Text("Hello, world!")
      }

      RelativeWidthStylableButton(.constant(homeReducer.state.buttonText), style: .main) {
        Task {
          await homeReducer.stopOrPlay()
        }
      }

      Spacer()
    }
    .padding()
    .background(Theme.Color.Background.main.color)
    .backButton(.constant("Logout")) {
      Task {
        await homeReducer.logout()
      }
    }
  }
}

#Preview {
  HomeView<HomeReducer>()
}
