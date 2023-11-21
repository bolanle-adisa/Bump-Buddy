//
//  PrivacyView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/21/23.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        List {
            // Add your settings options here
            Text("Option 1")
            Text("Option 2")
            Text("Option 3")
            // You can add more options or even use more complex views
        }
        .navigationBarTitle("Privacy", displayMode: .inline)
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}
