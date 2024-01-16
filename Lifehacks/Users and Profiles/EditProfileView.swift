//
//  EditProfileView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 13/01/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
  let user: User
  let onEditingFinished: () -> Void

  @State private var name: String
  @State private var aboutMe: String?
  @State private var photosItem: PhotosPickerItem?
  @State private var isDiscarding: Bool = false

  init(user: User, onEditingFinished: @escaping () -> Void) {
    self.user = user
    self.onEditingFinished = onEditingFinished
    self._name = .init(initialValue: user.name)
    self._aboutMe = .init(initialValue: user.aboutMe ?? "")
  }

  var body: some View {
    ScrollView {
      Header(
        name: $name,
        photosItem: $photosItem,
        profileImageURL: user.profileImageURL
      )
      AboutMe(
        text: Binding(
          get: { aboutMe ?? "" },
          set: { text in aboutMe = text }
        )
      )
    }
    .padding(20.0)
    .animation(.default, value: user)
    .navigationTitle("Edit Profile")
    .toolbar {
      cancelButton
      saveButton
    }
    .alert("Do you want to discard your edits?", isPresented: $isDiscarding) {
      Button("Discard changes", role: .destructive, action: onEditingFinished)
      Button("Continue editing", role: .cancel, action: {})
    }
  }
}

private extension EditProfileView {
  var isContentEdited: Bool {
    photosItem != nil
    || name != user.name
    || aboutMe != user.aboutMe
  }

  var cancelButton: some ToolbarContent {
    ToolbarItem(placement: .cancellationAction) {
      Button("Cancel") {
        if isContentEdited {
          isDiscarding = true
        } else {
          onEditingFinished()
        }
      }
    }
  }

  var saveButton: some ToolbarContent {
    ToolbarItem(placement: .confirmationAction) {
      Button("Save", action: onEditingFinished)
    }
  }
}

// MARK: - ErrorMessage

extension EditProfileView {
  struct ErrorMessage: View {
    let text: String

    init(_ text: String) {
      self.text = text
    }

    var body: some View {
      Text(text)
        .font(.footnote)
        .bold()
        .foregroundColor(.orange)
    }
  }
}

// MARK: - AboutMe

extension EditProfileView {
  struct AboutMe: View {
    @Binding var text: String

    var body: some View {
      VStack(alignment: .leading) {
        Text("About me")
          .font(.callout)
          .bold()
        TextEditor(text: $text)
          .frame(height: 200.0)
        EditProfileView.ErrorMessage("The about me cannot be empty")
          .visible(text.isEmpty)
      }
    }
  }
}

// MARK: - Header

extension EditProfileView {
  struct Header: View {
    @Binding var name: String
    @Binding var photosItem: PhotosPickerItem?
    var profileImageURL: URL?

    var body: some View {
      HStack(alignment: .top) {
        AsyncProfileImage(url: profileImageURL, borderColor: .gray)
        .frame(width: 62.0, height: 62.0)
        .overlay {
          PhotosPicker("Edit", selection: $photosItem)
            .bold()
            .foregroundColor(.white)
        }
        VStack(alignment: .leading) {
          TextField("Name", text: $name)
          Divider()
          EditProfileView.ErrorMessage("The name cannot be empty")
            .visible(name.isEmpty)
        }
        .padding(.leading, 16.0)
      }
    }
  }
}

// MARK: - Previews

#Preview {
  NavigationStack {
    EditProfileView(user: .preview, onEditingFinished: {})
  }
}

#Preview("Interactive Views") {
  struct PreviewContainer: View {
    @State private var name: String = User.preview.name
    @State private var aboutMe: String = User.preview.aboutMe!

    var body: some View {
      VStack {
        EditProfileView.Header(
          name: $name,
          photosItem: .constant(nil),
          profileImageURL: User.preview.profileImageURL
        )
        EditProfileView.AboutMe(text: $aboutMe)
      }
    }
  }

  return PreviewContainer()
}
