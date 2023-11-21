//
//  ProfileView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct ProfileView: View {
    // Example user data - this would be fetched from a user model in a real app
    @State private var userName = "Emily Johnson"
    @State private var userEmail = "emily.johnson@example.com"
    @EnvironmentObject var authManager: AuthManager // Corrected to use @EnvironmentObject

    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .padding(.top, 40)
                .foregroundColor(.blue)

            Text(userName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 10)

            Text(userEmail)
                .font(.subheadline)
                .foregroundColor(.gray)

            Spacer()

            Button(action: {
                authManager.logout() // Action for logging out
            }) {
                Text("Log Out")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding(.horizontal)
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView().environmentObject(AuthManager()) // Updated for preview
    }
}
