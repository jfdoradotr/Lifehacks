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
      Group {
        Text("Asked on \(question.creationDate.formatted(date: .long, time: .omitted))")
        Text("Viewed \(question.viewCount.formatted()) times")
      }
      .font(.caption)
      .foregroundColor(.secondary)
    }
  }
}

#Preview {
  QuestionView(question: .preview)
}
