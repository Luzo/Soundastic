import Resolver

public extension Resolver {
  static func registerAppDependencies() {
    register { AppReducer() }
  }
}
