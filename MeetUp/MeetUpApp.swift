//
//  MeetUpApp.swift
//  MeetUp
//
//  Created by Orlando Moraes Martins on 06/01/23.
//

import SwiftUI

@main
struct MeetUpApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
