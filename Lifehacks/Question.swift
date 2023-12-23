//
//  Question.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 23/12/23.
//

import Foundation

struct Question {
  let isAnswered: Bool
  let id: Int
  let score: Int
  let viewCount: Int
  let answerCount: Int
  let title: String
  let body: String
  let creationDate: Date
  let owner: User?
}
