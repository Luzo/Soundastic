//
//  StylableButton.swift
//
//
//  Created by Lubos Lehota on 01/06/2024.
//

import SwiftUI
import Theme

public struct StylableButton: View {
  private let backgroundColor: Theme.Color.Background
  private let outlineColor: Theme.Color.Background
  private let textColor: Theme.Color.Text
  private let horizontalPadding: CGFloat
  private let verticalPadding: CGFloat
  private let shouldExpand: Bool
  private let action: () -> Void
  @Binding private var text: String

  public init(
    _ text: Binding<String>,
    style: Theme.Style.Button,
    shouldExpand: Bool = false,
    action: @escaping () -> Void
  ) {
    backgroundColor = style.backgroundColor
    outlineColor = style.outlineColor
    textColor = style.textColor
    horizontalPadding = style.paddingHorizontal
    verticalPadding = style.paddingVertical
    self.shouldExpand = shouldExpand
    self.action = action
    _text = text
  }

  public var body: some View {
    Button(text, action: action)
      .backgroundStyle(backgroundColor.color)
      .foregroundStyle(textColor.color)
      .padding(.horizontal, horizontalPadding)
      .padding(.vertical, verticalPadding)
      .frame(maxWidth: shouldExpand ? .infinity : nil)
      .overlay(
        RoundedRectangle(cornerRadius: 8)
          .stroke(outlineColor.color, lineWidth: 1)
      )
  }
}

public struct RelativeWidthStylableButton: View {
  @Binding private var text: String
  private let style: Theme.Style.Button
  private let action: () -> Void

  public init(
    _ text: Binding<String>,
    style: Theme.Style.Button,
    action: @escaping () -> Void
  ) {
    self.style = style
    self.action = action
    _text = text
  }

  public var body: some View {
    StylableButton(_text, style: style, shouldExpand: true, action: action)
      .containerRelativeFrame(.horizontal) { parentWidth, _ in
        parentWidth * style.fixedPercentage
      }
  }
}

#Preview {
  StylableButton(.constant("abcd"), style: .main) {}
}

#Preview {
  RelativeWidthStylableButton(.constant("abcd"), style: .main) {}
}
