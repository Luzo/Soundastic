import Combine
import Core
import Login
import Resolver
import SwiftUI

public protocol HomeReducerDefinition: HomeReducerAction, ObservableObject {
  var state: HomeReducer.State { get }
}

public protocol HomeReducerAction {
  func changeText()
  func logout()
}

extension HomeReducer {
  public struct State: StateInitiable {
    var text: String = ""
    public init() {}
  }
}

public class HomeReducer: Reducer<HomeReducer.State>, HomeReducerDefinition {
  @Injected var loginSharedStore: LoginSharedStoreDefinition
  @Injected var navigationReducer: NavigationReducer

  public override init() {
    super.init()

    state.text = "CHANGE ME"
  }
}

@MainActor
public extension HomeReducer {
  func changeText() {
    state.text = [
      "abc",
      "def",
      "gh"
    ].randomElement() ?? ""
  }

  func logout() {
    loginSharedStore.text = "efg"
    ResolverScope.cached.reset()
    navigationReducer.navigateTo(.login)
  }
}
