//
//  UserController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 18/01/24.
//

import Foundation

final class UserController: ObservableObject {
  @Published private(set) var mainUser: User

  init(mainUser: User) {
    self.mainUser = mainUser
  }
}
