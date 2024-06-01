//
//  StylableButton.swift
//
//
//  Created by Lubos Lehota on 01/06/2024.
//

import SwiftUI
import Theme

public struct StylableButton: View {
  public init() {}

  public var body: some View {
    Button("Stylable Button") {
      // TODO:
    }
    .backgroundStyle(Theme.Color.Background.main.color)
  }
}

#Preview {
  StylableButton()
}
