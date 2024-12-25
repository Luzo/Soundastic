import Core
import Foundation
import Home
import Login
import Resolver

extension Resolver: @retroactive ResolverRegistering {
  public static func registerAllServices() {
    let isRunningTests = (ProcessInfo.processInfo.environment["isRunningTests"] as? NSString)?.boolValue ?? false

    if isRunningTests {
    } else {
      registerAppDependencies()
      registerHomeDependencies()
      registerLoginDependencies()
      registerCoreDependencies()
    }
  }
}
