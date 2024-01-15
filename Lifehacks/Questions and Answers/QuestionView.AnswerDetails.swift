//
//  QuestionView.AnswerDetails.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 15/01/24.
//

import SwiftUI

extension QuestionView {
  struct AnswerDetails: View {
    @Binding var answer: Answer

    var body: some View {
      HStack(alignment: .top, spacing: 16.0) {
        VStack(spacing: 16.0) {
          QuestionView.Voting(
            score: answer.score,
            vote: .init(vote: answer.vote),
            upvote: { answer.upvote() },
            downvote: { answer.downvote() },
            unvote: { answer.unvote() }
          )
          if answer.isAccepted {
            Image(systemName: "checkmark.circle.fill")
              .font(.largeTitle)
              .foregroundColor(.pizazz)
          }
        }
        VStack(alignment: .leading, spacing: 8.0) {
          QuestionView.MarkdownBody(text: answer.body)
          Text(date: answer.creationDate, prefix: "Answered on")
            .font(.caption)
            .foregroundColor(.secondary)
          if let owner = answer.owner {
            QuestionView.Owner(user: owner)
              .style(color: .pizazz)
              .frame(maxWidth: .infinity, alignment: .trailing)
          }
        }
      }
    }
  }
}

#Preview {
  QuestionView.AnswerDetails(answer: .constant(.preview))
    .padding(.horizontal, 20.0)
}
