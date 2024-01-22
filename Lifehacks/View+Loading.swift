//
//  View+Loading.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 22/01/24.
//

import SwiftUI

extension View {
  func loading(_ isLoading: Bool) -> some View {
    overlay {
      if isLoading {
        ProgressView("Loading...")
          .padding()
          .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 8.0))
      }
    }
  }

  func errorAlert(isPresented: Binding<Bool>) -> some View {
    alert(isPresented: isPresented) {
      Alert(title: Text("There was an error"), message: Text("Please try again later"))
    }
  }
}
