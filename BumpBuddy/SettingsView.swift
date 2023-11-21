// SettingsView.swift
import SwiftUI

struct SettingsView: View {
    @State private var enableNotifications: Bool = true
    @State private var dailyTips: Bool = true
    @State private var weeklySummary: Bool = false
    @State private var darkMode: Bool = false
    @State private var language: String = "English"
    @State private var unitOfMeasure: String = "Metric"

    var body: some View {
        List {
            Section(header: Text("Personal Preferences")) {
                Toggle(isOn: $enableNotifications) {
                    Text("Enable Notifications")
                }
                Toggle(isOn: $dailyTips) {
                    Text("Daily Health Tips")
                }
                Toggle(isOn: $weeklySummary) {
                    Text("Weekly Summary Emails")
                }
                Picker("Language", selection: $language) {
                    Text("English").tag("English")
                    Text("Spanish").tag("Spanish")
                    // Add more languages as needed
                }
                Picker("Unit of Measure", selection: $unitOfMeasure) {
                    Text("Metric").tag("Metric")
                    Text("Imperial").tag("Imperial")
                    // Add more units as needed
                }
            }

            Section(header: Text("App Settings")) {
                Toggle(isOn: $darkMode) {
                    Text("Dark Mode")
                }
                NavigationLink(destination: PrivacyView()) {
                    Text("Privacy & Security")
                }
            }
        }
        .navigationBarTitle("Settings", displayMode: .inline)
        .listStyle(GroupedListStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
