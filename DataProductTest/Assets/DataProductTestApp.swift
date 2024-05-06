//
//  DataProductTestApp.swift
//  DataProductTest
//
//  Created by Bema on 4/5/24.
//

import SwiftUI

@main
struct DataProductTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
