//
//  PrivacyView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/21/23.
//

import SwiftUI

struct PrivacyView: View {
    @State private var profileVisibility: Bool = true
    @State private var dataSharing: Bool = false
    @State private var twoFactorAuth: Bool = false
    @State private var locationTracking: Bool = false
    @State private var pushNotifications: Bool = true
    @State private var marketingPreferences: Bool = false
    @State private var healthDataVisibility: Bool = true

    var body: some View {
        List {
            Section(header: Text("Profile Settings")) {
                Toggle(isOn: $profileVisibility) {
                    Text("Profile Visibility")
                }
                Toggle(isOn: $healthDataVisibility) {
                    Text("Health Data Visibility")
                }
            }
            
            Section(header: Text("Security Settings")) {
                Toggle(isOn: $twoFactorAuth) {
                    Text("Two-Factor Authentication")
                }
            }
            
            Section(header: Text("Data Preferences")) {
                Toggle(isOn: $dataSharing) {
                    Text("Data Sharing with Partners")
                }
                Toggle(isOn: $marketingPreferences) {
                    Text("Marketing Preferences")
                }
            }

            Section(header: Text("App Settings")) {
                Toggle(isOn: $locationTracking) {
                    Text("Location Tracking")
                }
                Toggle(isOn: $pushNotifications) {
                    Text("Push Notifications")
                }
            }
        }
        .navigationBarTitle("Privacy & Security", displayMode: .inline)
        .listStyle(GroupedListStyle())
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
