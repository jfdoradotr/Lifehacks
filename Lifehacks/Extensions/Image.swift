//
//  Image.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 28/12/23.
//

import SwiftUI

extension Image {
  func circular(borderColor: Color = .white) -> some View {
    self
      .resizable()
      .clipShape(Circle())
      .overlay(Circle()
        .stroke(borderColor, lineWidth: 2))
  }
}

#Preview {
  Image("Avatar")
    .circular(borderColor: .accentColor)
    .frame(width: 200, height: 200)
}
