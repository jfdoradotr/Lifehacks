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
    Text(question.title)
      .font(.headline)
  }
}

#Preview {
  QuestionView(question: .preview)
}
