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
    guard vote != .up else { return }
    unvote()
    score += Vote.up.rawValue
    vote = .up
  }

  mutating func downvote() {
    guard vote != .down else { return }
    unvote()
    score += Vote.down.rawValue
    vote = .down
  }
}

extension Question {
  enum Vote: Int {
    case up = 1
    case down = -1
  }
}
