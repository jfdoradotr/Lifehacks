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

  @EnvironmentObject private var questionsController: QuestionsController

  var body: some View {
    ScrollView {
      LazyVStack {
        QuestionDetails(question: $questionsController[question.id])
          .padding(.bottom)
        Divider()
          .padding(.leading, 20.0)
        ForEach($questionsController[question.id].answers) { $answer in
          AnswerDetails(answer: $answer)
            .padding(.horizontal, 24.0)
            .padding(.vertical, 24.0)
            .id(answer.id)
          Divider()
            .padding(.leading, 20.0)
        }
      }
    }
    .padding(.top)
    .navigationTitle("Question")
    .navigationDestination(for: User.self) { user in
      ProfileView(user: user)
    }
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
        AsyncProfileImage(url: profileImageURL)
        .frame(width: 48.0, height: 48.0)
        VStack(alignment: .leading, spacing: 4.0) {
          Text(name)
            .font(.headline)
          Text("\(reputation.formatted()) reputation")
            .font(.caption)
        }
      }
      .padding(16)
      .styled(color: .accentColor)
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

// MARK: - OwnerLink

extension QuestionView {
  struct OwnerLink: View {
    let user: User?

    var body: some View {
      if let user {
        NavigationLink(value: user) {
          QuestionView.Owner(user: user)
            .styled()
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
      }
    }
  }
}

// MARK: - Preview

#Preview {
  NavigationStack {
    QuestionView(question: .preview)
  }
}

#Preview("Accessibility") {
  QuestionView.QuestionDetails(question: .constant(.preview))
    .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.xxxLarge)
}
