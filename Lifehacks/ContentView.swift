//
//  ContentView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 23/12/23.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var userController: UserController

  var body: some View {
    TabView {
      NavigationStack {
        TopQuestionsView()
      }
      .tabItem { Label("Top Questions", systemImage: "list.number") }
      NavigationStack {
        ProfileView(user: userController.mainUser)
      }
      .tabItem { Label("Profile", systemImage: "person.circle") }
      NavigationStack {
        SettingsView()
      }
      .tabItem { Label("Settings", systemImage: "gear") }
    }
  }
}

#Preview {
  ContentView()
    .theme(.vibrant)
    .tint(Theme.vibrant.accentColor)
}
