//
//  LifehacksApp.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 23/12/23.
//

import SwiftUI

@main
struct LifehacksApp: App {
  @StateObject private var settingsController = SettingsController()
  @StateObject private var userController: UserController
  @StateObject private var questionsController: QuestionsController

  init() {
    let persistenceController = PersistenceController()
    self._userController = .init(wrappedValue: UserController(mainUser: .preview, persistenceController: persistenceController))
    self._questionsController = .init(wrappedValue: QuestionsController(persistenceController: persistenceController))
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
        .theme(settingsController.theme)
        .tint(settingsController.theme.accentColor)
        .environmentObject(settingsController)
        .environmentObject(questionsController)
        .environmentObject(userController)
    }
  }
}
