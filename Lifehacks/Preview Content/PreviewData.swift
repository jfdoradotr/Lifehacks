//
//  PreviewData.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 24/12/23.
//

import Foundation

extension [Question] {
  static var preview: [Question] {
    let url = Bundle.main.url(forResource: "Questions", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    let wrapper = try! decoder.decode(Question.Wrapper.self, from: data)
    return wrapper.items
  }
}

extension Question {
  static var preview: Question {
    [Question].preview[0]
  }
}

extension User {
  static var preview: User {
    Question.preview.owner!
  }
}
