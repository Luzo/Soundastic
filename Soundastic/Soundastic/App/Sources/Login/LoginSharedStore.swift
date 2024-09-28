import Combine

public protocol LoginSharedStoreDefinition {
  var loggedIn: CurrentValueSubject<Bool, Never> { get set }
  var isLoginInProgress: CurrentValueSubject<Bool, Never> { get set }
  var text: String { get set }
}

struct LoginSharedStore: LoginSharedStoreDefinition {
  // TODO: add load and save from the memory
  var loggedIn: CurrentValueSubject<Bool, Never> = .init(false)
  var isLoginInProgress: CurrentValueSubject<Bool, Never> = .init(false)
  var text: String = ""
}
