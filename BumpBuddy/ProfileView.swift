//
//  ProfileView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var userName = "Emily Johnson"
    @State private var userEmail = "emily.johnson@example.com"
    @State private var isEditProfilePresented = false
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)
                    .padding(.top, 40)

                Text(userName)
                    .font(.title)
                    .fontWeight(.bold)

                Text(userEmail)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 20)

                // User options
                Group {
                    Button(action: {
                        isEditProfilePresented = true
                    }) {
                        ProfileOption(title: "Edit Profile", iconName: "pencil")
                    }
                    .sheet(isPresented: $isEditProfilePresented) {
                        EditProfileView(userName: $userName)
                    }

                    ProfileOption(title: "Settings", iconName: "gear")
                    ProfileOption(title: "Privacy", iconName: "shield.lefthalf.fill")
                    // Add more options as needed
                }
                
                Button(action: {
                    authManager.logout() // Action for logging out
                }) {
                    Text("Log Out")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }

    // Custom view for profile options
    private func ProfileOption(title: String, iconName: String) -> some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.blue)
                .frame(width: 30, height: 30)
            Text(title)
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthManager())
    }
}
