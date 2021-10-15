//
//  CoronaTrackerApp.swift
//  CoronaTracker
//
//  Created by Jessica Anguiano on 9/9/21.
//

import SwiftUI

@main
struct CoronaTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                CovidSummaryView().tabItem {
                    Label("Summary", systemImage: "square.and.pencil").foregroundColor(.white)
                }
                CitiesSummaryView().tabItem{
                    Label("Cities Summary", systemImage: "square.and.pencil").foregroundColor(.white)
                }
            }
        }
    }
}
