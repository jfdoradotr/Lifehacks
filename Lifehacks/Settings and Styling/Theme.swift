//
//  Theme.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 14/01/24.
//

import SwiftUI

struct Theme: Identifiable, Hashable {
  let name: String
  let accentColor: Color
  let secondaryColor: Color

  var id: String { name }

  static let `default` = Theme(
    name: "Default",
    accentColor: .accentColor,
    secondaryColor: .pizazz
  )

  static let vibrant = Theme(
    name: "Vibrant",
    accentColor: .electricViolet,
    secondaryColor: .blazeOrange
  )

  static let allThemes: [Theme] = [.default, .vibrant]
}
