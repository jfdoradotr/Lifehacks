//
//  AsyncProfileImage.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 15/01/24.
//

import SwiftUI

struct AsyncProfileImage: View {
  let url: URL?
  var borderColor: Color = .white

  var body: some View {
    AsyncImage(url: url) { image in
        image
        .circular()
    } placeholder: {
      ProgressView()
    }
  }
}
