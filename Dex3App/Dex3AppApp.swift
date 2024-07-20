//
//  Dex3AppApp.swift
//  Dex3App
//
//  Created by Anup Saud on 2024-07-20.
//

import SwiftUI

@main
struct Dex3AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
