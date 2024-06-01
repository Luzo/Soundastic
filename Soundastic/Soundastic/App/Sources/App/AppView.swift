//
//  ContentView.swift
//  Soundastic
//
//  Created by Lubos Lehota on 01/06/2024.
//

import Components
import SwiftUI
import Theme

public struct AppView: View {
  public init() {
  }

  public var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(Color.blue)
      Text("Hello, world!")
      StylableButton()
    }
    .padding()
    .background(Theme.Color.Background.main.color)
  }
}

#Preview {
  AppView()
}
