//
//  MainTabView.swift
//  BumpBuddy
//
//  Created by Bolanle Adisa on 11/17/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var showMotivation: Bool = false
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        NavigationView {
            TabView {
                PregnancyTrackerView()
                    .tabItem {
                        Label("Tracker", systemImage: "calendar")
                    }

                HealthInsightsView()
                    .tabItem {
                        Label("Health", systemImage: "staroflife.fill")
                    }

                AppointmentSchedulerView()
                    .tabItem {
                        Label("Appointments", systemImage: "clock.fill")
                    }

                DueDateEstimatorView()
                    .tabItem {
                        Label("Due Date", systemImage: "heart.circle.fill")
                    }

                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            .navigationBarTitle("Bump Buddy", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                showMotivation.toggle()
            }) {
                Image(systemName: "quote.bubble")
            })
            .sheet(isPresented: $showMotivation) {
                WeeklyMotivationView()
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView().environmentObject(AuthManager())
    }
}
