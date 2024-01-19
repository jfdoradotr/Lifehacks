//
//  QuestionsController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 18/01/24.
//

import Foundation

final class QuestionsController: ObservableObject {
  @Published var questions: [Question] {
    didSet { persistenceController.save(questions: questions) }
  }

  private let persistenceController: PersistenceController
  
  subscript(id: Int) -> Question {
    get { questions[index(for: id)] }
    set { questions[index(for: id)] = newValue }
  }

  init(persistenceController: PersistenceController) {
    self.questions = persistenceController.fetchQuestions() ?? []
    self.persistenceController = persistenceController
  }
}

private extension QuestionsController {
  func index(for id: Int) -> Int {
    questions.firstIndex(where: { $0.id == id })!
  }
}
