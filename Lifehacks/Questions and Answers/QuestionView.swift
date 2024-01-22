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
  @StateObject private var model: Model

  init(question: Question) {
    self.question = question
    self._model = .init(wrappedValue: Model(question: question))
  }

  var body: some View {
    Content(question: $questionsController[question.id])
      .navigationTitle("Question")
      .loading(model.isLoading)
      .errorAlert(isPresented: $model.showError)
      .task { await model.loadDetails() }
      .navigationDestination(for: User.self) { user in
        ProfileView(user: user)
      }
      .onChange(of: model.question) { newValue in
        questionsController[question.id] = newValue
      }
  }
}

// MARK: - Content

extension QuestionView {
  struct Content: View {
    @Binding var question: Question

    var body: some View {
      ScrollView {
        LazyVStack {
          QuestionView.QuestionDetails(question: $question)
            .padding(.bottom)
          Divider()
            .padding(.leading, 20.0)
          ForEach($question.answers) { $answer in
            QuestionView.AnswerDetails(answer: $answer)
              .padding(.horizontal, 24.0)
              .padding(.vertical, 24.0)
              .id(answer.id)
            Divider()
              .padding(.leading, 20.0)
          }
        }
      }
      .padding(.top)
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
    QuestionView.Content(question: .constant(.preview))
      .navigationTitle("Question")
  }
}

#Preview("Accessibility") {
  QuestionView.Content(question: .constant(.preview))
    .previewDevice(.init(rawValue: "iPhone SE (3rd generation)"))
    .preferredColorScheme(.dark)
    .dynamicTypeSize(.xxxLarge)
}
