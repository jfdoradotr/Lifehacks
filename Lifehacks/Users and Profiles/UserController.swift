//
//  UserController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 18/01/24.
//

import Foundation

final class UserController: ObservableObject {
  @Published private(set) var mainUser: User

  private let persistenceController: PersistenceController

  init(mainUser: User, persistenceController: PersistenceController) {
    self.mainUser = mainUser
    self.persistenceController = persistenceController
  }

  func save(name: String, aboutMe: String, profilePicture: Data?) throws {
    mainUser.name = name
    mainUser.aboutMe = aboutMe
    if let profilePicture {
      mainUser.profileImageURL = try persistenceController.saveProfileImageData(data: profilePicture)
    }
    persistenceController.save(user: mainUser)
  }
}
