import Foundation
import Resolver

public protocol SystemDependenciesProviderDefinition {
  var now: Date { get }
  var calendar: Calendar { get }
}

class SystemDependenciesProvider: SystemDependenciesProviderDefinition {
  var now: Date { Date() }
  var calendar: Calendar { Calendar.autoupdatingCurrent }
}

public extension Resolver {
  static func registerCoreDependencies() {
    register { SystemDependenciesProvider() }
      .implements(SystemDependenciesProviderDefinition.self)
      .scope(.container)
  }
}
