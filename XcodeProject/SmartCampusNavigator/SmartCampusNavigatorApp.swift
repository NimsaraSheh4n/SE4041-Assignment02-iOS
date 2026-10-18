import SwiftUI
import CoreData

@main
struct SmartCampusNavigatorApp: App {

    private let persistenceController =
        PersistenceController.shared

    var body: some Scene {

        WindowGroup {

            HomeView()
                .environment(
                    \.managedObjectContext,
                    persistenceController
                        .container
                        .viewContext
                )
        }
    }
}
