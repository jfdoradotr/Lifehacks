//
//  PreviewData.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 24/12/23.
//

import Foundation

extension User {
  static var preview: User {
    User(
      id: 0,
      reputation: 1_234,
      name: "Betty Vazquez",
      aboutMe: "The monkey-rope is found in all whalers; but it was only in the Pequod that the monkey and his holder were ever tied together. This improvement upon the original usage was introduced by no less a man than Stubb, in order to afford the imperilled harpooneer the strongest possible guarantee for the faithfulness and vigilance of his monkey-rope holder.",
      profileImageURL: nil
    )
  }
}

extension Question {
  static var preview: Question {
    Question(
      isAnswered: true,
      id: 0,
      viewCount: 2_770,
      answerCount: 9,
      title: "In the tumultuous business of cutting-in and attending to a whale, there is much running backwards and forwards among the crew.",
      body: "So strongly and metaphysically did I conceive of my situation then, that while earnestly watching his motions. I seemed distinctly to perceive that my own individuality was now merged in a joint stock company of two; that my free will had received a mortal wound; and that another's mistake or misfortune might plunge innocent me into unmerited disaster and death.",
      creationDate: Date(),
      owner: .preview,
      score: 359
    )
  }
}
