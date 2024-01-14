//
//  TopQuestionsView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 14/01/24.
//

import SwiftUI

struct TopQuestionsView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// MARK: - Row

extension TopQuestionsView {
  struct Row: View {
    var body: some View {
      Text("Hello, World!")
    }
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
        Text("Viewed \(viewCount.formatted()) times")
        Text("Asked on \(date.formatted(date: .long, time: .omitted))")
        Text(name)
      }
      .font(.caption)
      .foregroundColor(.secondary)
    }
  }
}

// MARK: - Previews

#Preview {
    TopQuestionsView()
}
