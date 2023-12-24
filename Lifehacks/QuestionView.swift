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
    HStack(alignment: .top, spacing: 16.0) {
      VStack(spacing: 8.0) {
        VoteButton(imageName: "arrowtriangle.up.fill")
        Text("\(question.score)")
          .font(.title)
          .foregroundColor(.secondary)
        VoteButton(imageName: "arrowtriangle.down.fill")
      }
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
}

extension QuestionView {
  struct VoteButton: View {
    let imageName: String

    var body: some View {
      Button(action: {}, label: {
        Image(systemName: imageName)
      })
    }
  }
}

#Preview {
  QuestionView(question: .preview)
}
