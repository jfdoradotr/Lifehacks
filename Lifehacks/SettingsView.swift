//
//  SettingsView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 14/01/24.
//

import SwiftUI

struct SettingsView: View {
  @State var selectedThemeID: String? = Theme.default.id

  var body: some View {
    List(selection: $selectedThemeID) {
      Section(header: Text("APP THEME")) {
        ForEach(Theme.allThemes) { theme in
          Row(theme: theme)
            .listRowInsets(.init(
              top: 16.0,
              leading: 16.0,
              bottom: 16.0,
              trailing: 16.0)
            )
        }
      }
    }
  }
}

// MARK: - Row

extension SettingsView {
  struct Row: View {
    let theme: Theme

    var body: some View {
      LabeledContent {
        Placeholder(imageName: "sun.max.fill")
          .style(color: theme.accentColor)
        Placeholder(imageName: "moon.fill")
          .style(color: theme.secondaryColor)
        Placeholder(imageName: "leaf")
          .style(color: theme.secondaryColor, isFilled: false)
      } label: {
        Text(theme.name)
      }
      .font(.headline)
      .foregroundColor(.primary)
    }
  }
}

extension SettingsView.Row {
  struct Placeholder: View {
    let imageName: String

    var body: some View {
      Image(systemName: imageName)
        .frame(width: 42.0, height: 42.0)
    }
  }
}

// MARK: - Previews

#Preview {
  SettingsView()
}
