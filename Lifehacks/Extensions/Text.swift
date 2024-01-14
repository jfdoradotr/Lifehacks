//
//  Text.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 14/01/24.
//

import SwiftUI

extension Text {
  init(viewCount: Int) {
    self.init("Viewed \(viewCount.formatted()) times")
  }

  init(date: Date, prefix: String = "Asked on") {
    self.init(prefix + " " + date.formatted(date: .long, time: .omitted))
  }
}
