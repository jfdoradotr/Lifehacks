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

  var body: some Scene {
    WindowGroup {
      ContentView()
        .theme(settingsController.theme)
        .tint(settingsController.theme.accentColor)
        .environmentObject(settingsController)
    }
  }
}
