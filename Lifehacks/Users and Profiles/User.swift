//
//  User.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 23/12/23.
//

import Foundation

struct User: Hashable {
  let id: Int
  let reputation: Int
  var name: String
  var aboutMe: String?
  let profileImageURL: URL?
}

extension User: Codable {
  enum CodingKeys: String, CodingKey {
    case id = "user_id"
    case name = "display_name"
    case aboutMe = "about_me"
    case profileImageURL = "profile_image"
    case userType = "user_type"
    case reputation
  }

  enum DecodingError: Error {
    case userDoesNotExist
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    let userType = try container.decode(String.self, forKey: .userType)
    guard userType != "does_not_exist" else {
      throw DecodingError.userDoesNotExist
    }

    self.id = try container.decode(Int.self, forKey: .id)
    self.reputation = try container.decode(Int.self, forKey: .reputation)
    self.name = try container.decode(String.self, forKey: .name)
    self.aboutMe = try container.decodeIfPresent(String.self, forKey: .aboutMe)
    self.profileImageURL = try container.decodeIfPresent(URL.self, forKey: .profileImageURL)
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(self.id, forKey: .id)
    try container.encode(self.reputation, forKey: .reputation)
    try container.encode(self.name, forKey: .name)
    try container.encodeIfPresent(self.aboutMe, forKey: .aboutMe)
    try container.encodeIfPresent(self.profileImageURL, forKey: .profileImageURL)
  }
}

extension User {
  struct Wrapper: Decodable {
    let items: [User]

    enum CodingKeys: CodingKey {
      case items
    }
  }
}
