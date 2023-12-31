//
//  HabitsTrackerApp.swift
//  HabitsTracker
//
//  Created by Robert-Dumitru Oprea on 13/10/2023.
//

import SwiftUI

@main
struct HabitsTrackerApp: App {
    @StateObject var dataController: DataController = DataController()
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SideBarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
                .onChange(of: scenePhase) {
                if scenePhase != .active {
                    dataController.save()
                }
            }
        }
    }
}
