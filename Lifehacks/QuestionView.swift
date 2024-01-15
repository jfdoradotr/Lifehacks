//
//  QuestionView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 24/12/23.
//

import SwiftUI

// MARK: - QuestionView

struct QuestionView: View {
  @State var question: Question

  var body: some View {
    VStack(alignment: .leading, spacing: 24.0) {
      HStack(alignment: .top, spacing: 16.0) {
        Voting(
          score: question.score,
          vote: .init(vote: question.vote),
          upvote: { question.upvote() },
          downvote: { question.downvote() },
          unvote: { question.unvote() }
        )
        Info(question: question)
      }
      QuestionBody(text: question.body)
      if let owner = question.owner {
        Owner(user: owner)
          .frame(maxWidth: .infinity, alignment: .trailing)
      }
    }
    .padding(.horizontal, 20.0)
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
          Text(date: date)
          Text(viewCount: viewCount)
        }
        .font(.caption)
        .foregroundColor(.secondary)
      }
    }
  }
}

extension QuestionView.Info {
  init(question: Question) {
    title = question.title
    viewCount = question.viewCount
    date = question.creationDate
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

#Preview {
  QuestionView(question: .preview)
}

#Preview("Accessibility") {
  QuestionView(question: .preview)
    .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.xxxLarge)
}
