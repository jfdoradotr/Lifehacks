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
}
