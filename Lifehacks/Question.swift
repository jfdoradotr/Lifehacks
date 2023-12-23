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
  let viewCount: Int
  let answerCount: Int
  let title: String
  let body: String
  let creationDate: Date
  let owner: User?

  private(set) var score: Int
  private(set) var vote: Vote?

  mutating func unvote() {
    guard let vote else { return }
    score -= vote.rawValue
    self.vote = nil
  }

  mutating func upvote() {
    cast(vote: .up)
  }

  mutating func downvote() {
    cast(vote: .down)
  }
}

extension Question {
  enum Vote: Int {
    case up = 1
    case down = -1
  }
}

private extension Question {
  mutating func cast(vote: Vote) {
    guard self.vote != vote else { return }
    unvote()
    score += vote.rawValue
    self.vote = vote
  }
}

extension Question: Decodable {
  enum CodingKeys: String, CodingKey {
    case id = "question_id"
    case viewCount = "view_count"
    case answerCount = "answer_count"
    case isAnswered = "is_answered"
    case creationDate = "creation_date"
    case body = "body_markdown"
    case title, score, owner
  }
}
