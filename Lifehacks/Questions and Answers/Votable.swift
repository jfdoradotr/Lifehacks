//
//  Votable.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 14/01/24.
//

import Foundation

enum Vote: Int {
  case up = 1
  case down = -1
}

protocol Votable {
  var score: Int { get set }
  var vote: Vote? { get set }
}

extension Votable {
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

private extension Votable {
  mutating func cast(vote: Vote) {
    guard self.vote != vote else { return }
    unvote()
    score += vote.rawValue
    self.vote = vote
  }
}
