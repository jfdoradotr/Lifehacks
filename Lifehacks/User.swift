//
//  User.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 23/12/23.
//

import Foundation

struct User {
  let id: Int
  let reputation: Int
  let name: String
  let aboutMe: String?
  let profileImageURL: URL?
}

extension User: Decodable {
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
    self.aboutMe = try container.decode(String.self, forKey: .aboutMe)
    self.profileImageURL = try container.decode(URL.self, forKey: .profileImageURL)
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
