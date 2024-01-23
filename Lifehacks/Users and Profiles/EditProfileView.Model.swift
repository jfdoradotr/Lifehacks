//
//  EditProfileView.Model.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 23/01/24.
//

import Foundation
import SwiftUI
import PhotosUI

extension EditProfileView {
  final class Model: ObservableObject {
    @Published var name: String
    @Published var aboutMe: String
    @Published var photosItem: PhotosPickerItem?

    let user: User

    var isContentEdited: Bool {
      photosItem != nil
      || name != user.name
      || aboutMe != user.aboutMe
    }

    init(user: User) {
      self.user = user
      self.name = user.name
      self.aboutMe = user.aboutMe ?? ""
    }
  }
}
