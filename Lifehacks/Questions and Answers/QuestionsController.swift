//
//  QuestionsController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 18/01/24.
//

import Foundation

final class QuestionsController: ObservableObject {
  @Published var questions: [Question]

  private let persistenceController: PersistenceController

  init(persistenceController: PersistenceController) {
    self.questions = persistenceController.fetchQuestions() ?? []
    self.persistenceController = persistenceController
  }
}
