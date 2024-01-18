//
//  QuestionsController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 18/01/24.
//

import Foundation

final class QuestionsController: ObservableObject {
  @Published var questions: [Question]

  init(questions: [Question]) {
    self.questions = questions
  }
}
