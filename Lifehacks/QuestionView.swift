//
//  QuestionView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 24/12/23.
//

import SwiftUI

// MARK: - QuestionView

struct QuestionView: View {
  let question: Question

  var body: some View {
    HStack(alignment: .top, spacing: 16.0) {
      Voting(score: question.score)
      Info(title: question.title, viewCount: question.viewCount, date: question.creationDate)
    }
  }
}

// MARK: - Voting

extension QuestionView {
  struct Voting: View {
    let score: Int

    var body: some View {
      VStack(spacing: 8.0) {
        VoteButton(imageName: "arrowtriangle.up.fill")
        Text("\(score)")
          .font(.title)
          .foregroundColor(.secondary)
        VoteButton(imageName: "arrowtriangle.down.fill")
      }
    }
  }
}

// MARK: - VoteButton

extension QuestionView.Voting {
  struct VoteButton: View {
    let imageName: String

    var body: some View {
      Button(action: {}, label: {
        Image(systemName: imageName)
      })
    }
  }
}

extension QuestionView.Voting.VoteButton {
  enum ButtonType: String {
    case up = "arrowtriangle.up"
    case down = "arrowtriangle.down"

    func image(highlighted: Bool) -> Image {
      let imageName = rawValue + (highlighted ? ".fill" : "")
      return Image(systemName: imageName)
    }
  }
}

// MARK: - Info

extension QuestionView {
  struct Info: View {
    let title: String
    let viewCount: Int
    let date: Date

    var body: some View {
      VStack(alignment: .leading, spacing: 8.0) {
        Text(title)
          .font(.headline)
        Group {
          Text("Asked on \(date.formatted(date: .long, time: .omitted))")
          Text("Viewed \(viewCount.formatted()) times")
        }
        .font(.caption)
        .foregroundColor(.secondary)
      }
    }
  }
}

// MARK: - Preview

#Preview {
  QuestionView(question: .preview)
}
