public extension Optional {
  func unwrap(or: Wrapped) -> Wrapped {
    guard let value = self else { return or }

    return value
  }
}

public extension Optional {
  func unwrapToString(or: String, transform: (Wrapped) -> String) -> String {
    guard let value = self else { return or }

    return transform(value)
  }
}
