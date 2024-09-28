import Resolver

public extension Resolver {
  static func registerHomeDependencies() {
    register { HomeReducer() }
  }
}
