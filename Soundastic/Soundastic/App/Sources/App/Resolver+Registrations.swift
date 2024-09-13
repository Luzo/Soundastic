import Core
import Home
import Login
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    // TODO: create separate dependency resolvers for each framework
    register { AppReducer() }
    register { LoginReducer() }
    register { HomeReducer() }

    registerCoreDependencies()
  }
}
