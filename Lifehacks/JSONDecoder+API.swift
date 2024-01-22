//
//  JSONDecoder+API.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 22/01/24.
//

import Foundation

extension JSONDecoder {
  static var apiDecoder: JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return decoder
  }
}
