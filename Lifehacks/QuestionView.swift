//
//  QuestionView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 24/12/23.
//

import SwiftUI

struct QuestionView: View {
  let question: Question

  var body: some View {
    VStack(alignment: .leading, spacing: 8.0) {
      Text(question.title)
        .font(.headline)
      Text("Asked on Sep 15th, 2019")
      Text("Viewed 2.770 times")
    }
  }
}

#Preview {
  QuestionView(question: .preview)
}
