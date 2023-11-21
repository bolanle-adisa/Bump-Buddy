//
//  SettingsView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/21/23.
//

// SettingsView.swift
import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            // Add your settings options here
            Text("Option 1")
            Text("Option 2")
            Text("Option 3")
            // You can add more options or even use more complex views
        }
        .navigationBarTitle("Settings", displayMode: .inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
