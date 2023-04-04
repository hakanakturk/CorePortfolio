//
//  CorePortfolioApp.swift
//  CorePortfolio
//
//  Created by Hakan Aktürk on 30.03.2023.
//

import SwiftUI

@main
struct CorePortfolioApp: App {
    
    @StateObject var dataController = DataController()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView()
            } content: {
                ContentView()
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
            .onChange(of: scenePhase) {phase in
                if phase != .active {
                    dataController.save()
                }
            }
        }
    }
}
