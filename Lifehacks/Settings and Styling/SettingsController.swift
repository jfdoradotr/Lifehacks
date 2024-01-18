//
//  SettingsController.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 18/01/24.
//

import Foundation

final class SettingsController: ObservableObject {
  @Published var selectedThemeID: String? = Theme.default.id {
    didSet {
      defaults.set(selectedThemeID, forKey: UserDefaultKeys.themeID)
    }
  }

  private var defaults = UserDefaults.standard

  var theme: Theme {
    guard let selectedThemeID, let theme = Theme.allThemes.first(where: { $0.id == selectedThemeID }) else {
      return Theme.default
    }
    return theme
  }

  init() {
    selectedThemeID = defaults.string(forKey: UserDefaultKeys.themeID)
  }
}

private extension SettingsController {
  struct UserDefaultKeys {
    static let themeID = "ThemeID"
  }
}
