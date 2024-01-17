//
//  QuestionView.Voting.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 14/01/24.
//

import SwiftUI

// MARK: - Voting

extension QuestionView {
  struct Voting: View {
    let score: Int
    let vote: Vote?
    let upvote: () -> Void
    let downvote: () -> Void
    let unvote: () -> Void

    enum Vote {
      case up, down
    }

    var body: some View {
      VStack(spacing: 8.0) {
        content
      }
    }

    private func cast(vote: Vote) {
      switch (self.vote, vote) {
      case (nil, .up), (.down, .up): upvote()
      case (nil, .down), (.up, .down): downvote()
      default: unvote()
      }
    }
  }
}

private extension QuestionView.Voting {
  var content: some View {
    Group {
      VoteButton(buttonType: .up, highlighted: vote == .up) {
        cast(vote: .up)
      }
      Text("\(score)")
        .font(.title)
        .foregroundColor(.secondary)
      VoteButton(buttonType: .down, highlighted: vote == .down) {
        cast(vote: .down)
      }
    }
  }
}

extension QuestionView.Voting.Vote {
  init?(vote: Vote?) {
    switch vote {
    case .up: self = .up
    case .down: self = .down
    case .none: return nil
    }
  }
}

// MARK: - VoteButton

extension QuestionView.Voting {
  struct VoteButton: View {
    let buttonType: ButtonType
    let highlighted: Bool
    let action: () -> Void

    var body: some View {
      Button(action: action) {
        buttonType.image(highlighted: highlighted)
          .resizable()
          .frame(width: 32, height: 32)
      }
    }
  }
}

extension QuestionView.Voting.VoteButton {
  enum ButtonType: String {
    case up = "arrowtriangle.up"
    case down = "arrowtriangle.down"

    func image(highlighted: Bool) -> Image {
      let imageName = rawValue + (highlighted ? ".fill" : "")
      return Image(systemName: imageName)
    }
  }
}

#Preview("Vote Button", traits: .sizeThatFitsLayout) {
  HStack(spacing: 16.0) {
    QuestionView.Voting.VoteButton(buttonType: .up, highlighted: true, action: {})
    QuestionView.Voting.VoteButton(buttonType: .up, highlighted: false, action: {})
    QuestionView.Voting.VoteButton(buttonType: .down, highlighted: true, action: {})
    QuestionView.Voting.VoteButton(buttonType: .down, highlighted: false, action: {})
  }
}
