//
//  QuestionView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 24/12/23.
//

import SwiftUI

// MARK: - QuestionView

struct QuestionView: View {
  var body: some View {
    Text("Hello, World!")
  }
}

// MARK: - MarkdownBody

extension QuestionView {
  struct MarkdownBody: View {
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

// MARK: - Owner

extension QuestionView {
  struct Owner: View {
    let name: String
    let reputation: Int
    let profileImageURL: URL?

    var body: some View {
      HStack {
        AsyncImage(url: profileImageURL) { image in
            image
            .circular()
        } placeholder: {
          ProgressView()
        }
        .frame(width: 48.0, height: 48.0)
        VStack(alignment: .leading, spacing: 4.0) {
          Text(name)
            .font(.headline)
          Text("\(reputation.formatted()) reputation")
            .font(.caption)
        }
      }
      .padding(16)
      .style(color: .accentColor)
    }
  }
}

extension QuestionView.Owner {
  init(user: User) {
    name = user.name
    reputation = user.reputation
    profileImageURL = user.profileImageURL
  }
}

// MARK: - Preview

#Preview("Accessibility") {
  QuestionView.QuestionDetails(question: .constant(.preview))
    .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.xxxLarge)
}
