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
    VStack {
      HStack(alignment: .top, spacing: 16.0) {
        Voting(score: question.score)
        Info(title: question.title, viewCount: question.viewCount, date: question.creationDate)
      }
      QuestionBody(text: question.body)
    }
    .padding(.horizontal, 20.0)
  }
}

// MARK: - Voting

extension QuestionView {
  struct Voting: View {
    let score: Int

    var body: some View {
      VStack(spacing: 8.0) {
        VoteButton(buttonType: .up, highlighted: false)
        Text("\(score)")
          .font(.title)
          .foregroundColor(.secondary)
        VoteButton(buttonType: .down, highlighted: false)
      }
    }
  }
}

// MARK: - VoteButton

extension QuestionView.Voting {
  struct VoteButton: View {
    let buttonType: ButtonType
    let highlighted: Bool

    var body: some View {
      Button(action: {}, label: {
        buttonType.image(highlighted: highlighted)
          .resizable()
          .frame(width: 32, height: 32)
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

// MARK: - QuestionBody

extension QuestionView {
  struct QuestionBody: View {
    let text: String

    var body: some View {
      let markdown = try! AttributedString(
        markdown: text,
        options: .init(interpretedSyntax: .inlineOnlyPreservingWhitespace)
      )
      Text(markdown)
        .font(.subheadline)
    }
  }
}

// MARK: - Preview

#Preview {
  QuestionView(question: .preview)
}

#Preview {
  HStack(spacing: 16.0) {
    QuestionView.Voting.VoteButton(buttonType: .up, highlighted: true)
    QuestionView.Voting.VoteButton(buttonType: .up, highlighted: false)
    QuestionView.Voting.VoteButton(buttonType: .down, highlighted: true)
    QuestionView.Voting.VoteButton(buttonType: .down, highlighted: false)
  }
}
