import Core
import Home
import Login
import Resolver

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    registerAppDependencies()
    registerHomeDependencies()
    registerLoginDependencies()
    registerCoreDependencies()
  }
}
