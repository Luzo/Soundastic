import SwiftUI

struct BackButtonModifier: ViewModifier {
  @Binding private var title: String
  private let action: () -> Void

  init(
    _ title: Binding<String>,
    action: @escaping () -> Void
  ) {
    self.action = action
    _title = title
  }

  func body(content: Content) -> some View {
    content
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            action()
          } label: {
            HStack {
              Image(systemName: "chevron.backward")
              Text(title)
            }
          }
        }
      }
  }
}

public extension View {
  func backButton(
    _ title: Binding<String>,
    action: @escaping () -> Void
  ) -> some View {
    modifier(
      BackButtonModifier(title, action: action)
    )
  }
}
