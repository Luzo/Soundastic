import Combine
import Core
import Login
import Resolver
import SwiftUI

public protocol HomeReducerDefinition: HomeReducerAction, ObservableObject {
  var state: HomeReducer.State { get }
}

public protocol HomeReducerAction {
  func stopOrPlay() async
  func logout() async
}

extension HomeReducer {
  public struct State: StateInitiable {
    var isPlaying: Bool = false
    var nowPlayingText: String = ""
    var buttonText: String = ""
    var selectedSong: String? = ""

    public init() {}
  }
}

public class HomeReducer: Reducer<HomeReducer.State>, HomeReducerDefinition {
  @Injected var loginSharedStore: LoginSharedStoreDefinition
  @Injected var outboundNavigationReducer: HomeOutboundNavigationReducerDefinition

  public override init() {
    super.init()

    state.buttonText = "Play"
    state.nowPlayingText = state.selectedSong.unwrapToString(or: "Please select song") { "Now playing: \($0)" }
  }
}

@MainActor
extension HomeReducer: HomeReducerAction {
  public func stopOrPlay() async {
    state.isPlaying.toggle()
    state.buttonText = state.isPlaying ? "Stop" : "Play"
  }

  public func logout() async {
    loginSharedStore.text = "efg"
    ResolverScope.cached.reset()
    outboundNavigationReducer.navigateTo(.logout)
  }
}
