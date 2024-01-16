//
//  ProfileView.swift
//  Lifehacks
//
//  Created by Juan Francisco Dorado Torres on 15/01/24.
//

import SwiftUI

struct ProfileView: View {
  let user: User

  @State private var isEditing = false

  var body: some View {
    ScrollView {
      Header(user: user, isMainUser: isMainUser)
      Text(user.aboutMe ?? "")
        .padding(.top, 16.0)
        .padding(.horizontal, 20.0)
    }
    .navigationTitle(Text("Profile"))
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        if isMainUser {
          Button(action: { isEditing = true }, label: {
            Text("Edit")
          })
        }
      }
    }
  }
}

private extension ProfileView {
  var isMainUser: Bool {
    user.id == 0
  }
}

// MARK: - Header

extension ProfileView {
  struct Header: View {
    let name: String
    let reputation: Int
    let profileImageURL: URL?
    let isMainUser: Bool

    var body: some View {
      VStack(spacing: 4.0) {
        AsyncProfileImage(url: profileImageURL)
          .frame(width: 144, height: 144)
        Text(name)
          .font(.title)
          .bold()
          .padding(.top, 12.0)
        Text("\(reputation.formatted()) reputation")
          .font(.headline)
      }
      .frame(maxWidth: .infinity)
      .padding([.top, .bottom], 24)
      .style(color: isMainUser ? .accentColor : .pizazz, isRounded: false)
    }
  }
}

extension ProfileView.Header {
  init(user: User, isMainUser: Bool) {
    self.init(
      name: user.name,
      reputation: user.reputation,
      profileImageURL: user.profileImageURL,
      isMainUser: isMainUser
    )
  }
}

// MARK: - Previews

#Preview {
  NavigationStack {
    ProfileView(user: .preview)
  }
}

#Preview("Header") {
  VStack {
    ProfileView.Header(user: .preview, isMainUser: true)
    ProfileView.Header(user: .preview, isMainUser: false)
  }
}
