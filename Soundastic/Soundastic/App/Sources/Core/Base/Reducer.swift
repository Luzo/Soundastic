import Combine

public protocol ReducerDefinition {
  func cancellablesToRegister() -> [AnyCancellable]
}

public protocol StateInitiable {
  init()
}

open class Reducer<State: StateInitiable>: ReducerDefinition {
  @Published public var state: State

  private var collector: [AnyCancellable] = []

  public init() {
    self.state = .init()
    setupObserving(cancellables: cancellablesToRegister())
  }

  public func setupObserving(cancellables: [AnyCancellable]) {
    collector.append(contentsOf: cancellables)
  }

  open func cancellablesToRegister() -> [AnyCancellable] {
    return []
  }
}
