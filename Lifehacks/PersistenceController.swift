//
//  PersistenceController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 18/01/24.
//

import Foundation

final class PersistenceController {
  func save(questions: [Question]) {
    guard let data = try? JSONEncoder().encode(questions) else { return }
    try? data.write(to: .jsonFileURLNamed(.questions))
  }

  func fetchQuestions() -> [Question]? {
    guard let data = try? Data(contentsOf: .jsonFileURLNamed(.user)) else { return nil }
    return try? JSONDecoder().decode([Question].self, from: data)
  }

  func save(user: User) {
    guard let data = try? JSONEncoder().encode(user) else { return }
    try? data.write(to: .jsonFileURLNamed(.user))
  }

  func fetchUser() -> User? {
    guard let data = try? Data(contentsOf: .jsonFileURLNamed(.user)) else { return nil }
    return try? JSONDecoder().decode(User.self, from: data)
  }
}

private extension URL {
  static func jsonFileURLNamed(_ name: String) -> URL {
    URL.documentsDirectory
      .appendingPathComponent(name)
      .appendingPathExtension("json")
  }
}

private extension String {
  static var questions: String { "Questions" }
  static var user: String { "User" }
}
