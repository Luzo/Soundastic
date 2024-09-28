import Resolver

public extension Resolver {
  static func registerCoreDependencies() {
    register { SystemDependenciesProvider() }
      .implements(SystemDependenciesProviderDefinition.self)
      .scope(.container)

    register { NavigationReducer() }
      .scope(.container)
  }
}
