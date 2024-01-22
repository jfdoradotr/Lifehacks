//
//  TopQuestionsView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 14/01/24.
//

import SwiftUI

struct TopQuestionsView: View {
  @EnvironmentObject private var questionsController: QuestionsController

  var body: some View {
    Content(questions: $questionsController.questions)
      .navigationTitle("Top Questions")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          EditButton()
        }
      }
      .navigationDestination(for: Question.self) { question in
        QuestionView(question: question)
      }
  }
}

// MARK: - ContentView

extension TopQuestionsView {
  struct Content: View {
    @Binding var questions: [Question]

    var body: some View {
      List {
        ForEach(questions) { question in
          NavigationLink(value: question) {
            TopQuestionsView.Row(question: question)
          }
        }
        .onDelete(perform: deleteItems(atOffsets:))
        .onMove(perform: move(fromOffsets:atOffsets:))
      }
      .listStyle(.plain)
    }

    func deleteItems(atOffsets offsets: IndexSet) {
      questions.remove(atOffsets: offsets)
    }

    func move(fromOffsets source: IndexSet, atOffsets destination: Int) {
      questions.move(fromOffsets: source, toOffset: destination)
    }
  }
}

// MARK: - Row

extension TopQuestionsView {
  struct Row: View {
    let title: String
    let score: Int
    let answerCount: Int
    let viewCount: Int
    let date: Date
    let name: String
    let isAnswered: Bool

    var body: some View {
      VStack(alignment: .leading, spacing: 8) {
        Text(title)
          .font(.headline)
        HStack(alignment: .center, spacing: 16) {
          Counter(count: score, label: "votes")
            .styled()
          Counter(count: answerCount, label: "answers")
            .styled(isFilled: isAnswered)
            .role(.secondary)
          Details(viewCount: viewCount, date: date, name: name)
        }
        .padding(.vertical, 8)
      }
    }
  }
}

extension TopQuestionsView.Row {
  init(question: Question) {
    self.init(
      title: question.title,
      score: question.score,
      answerCount: question.answerCount,
      viewCount: question.viewCount,
      date: question.creationDate,
      name: question.owner?.name ?? "",
      isAnswered: question.isAnswered
    )
  }
}

// MARK: - Counter

extension TopQuestionsView.Row {
  struct Counter: View {
    let count: Int
    let label: String

    var body: some View {
      VStack {
        Text("\(count)")
          .font(.title3)
          .bold()
        Text(label)
          .font(.caption)
      }
      .frame(width: 67, height: 67)
    }
  }
}

// MARK: - Details

extension TopQuestionsView.Row {
  struct Details: View {
    let viewCount: Int
    let date: Date
    let name: String

    var body: some View {
      VStack(alignment: .leading, spacing: 4.0) {
        Text(viewCount: viewCount)
        Text(date: date)
        Text(name)
      }
      .font(.caption)
      .foregroundColor(.secondary)
    }
  }
}

// MARK: - Previews

#Preview {
  NavigationStack {
    TopQuestionsView.Content(questions: .constant(.preview))
  }
}

#Preview("Rows") {
  VStack {
    TopQuestionsView.Row(question: .preview)
    TopQuestionsView.Row(question: .unanswered)
  }
}
