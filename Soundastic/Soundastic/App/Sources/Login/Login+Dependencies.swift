import Resolver

public extension Resolver {
  static func registerLoginDependencies() {
    register { LoginReducer() }
    register { LoginSharedStore() }
      .implements(LoginSharedStoreDefinition.self)
      .scope(.cached)
  }
}
