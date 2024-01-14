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
    User(
      id: 0,
      reputation: 0,
      name: "Claude Bluebeard",
      aboutMe: "The monkey-rope is found in all whalers; but it was only in the Pequod that the monkey and his holder were ever tied together. This improvement upon the original usage was introduced by no less a man than Stubb, in order to afford the imperilled harpooneer the strongest possible guarantee for the faithfulness and vigilance of his monkey-rope holder.",
      profileImageURL: Bundle.main.url(forResource: "Avatar", withExtension: "jpg")!
    )
  }
}
