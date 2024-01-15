//
//  View.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 13/01/24.
//

import SwiftUI

extension View {
  func visible(_ isVisible: Bool) -> some View {
    opacity(isVisible ? 1.0 : 0.0)
  }
}
