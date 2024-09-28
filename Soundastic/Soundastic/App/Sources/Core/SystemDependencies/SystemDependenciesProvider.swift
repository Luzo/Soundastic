import Foundation

public protocol SystemDependenciesProviderDefinition {
  var now: Date { get }
  var calendar: Calendar { get }
}

class SystemDependenciesProvider: SystemDependenciesProviderDefinition {
  var now: Date { Date() }
  var calendar: Calendar { Calendar.autoupdatingCurrent }
}
