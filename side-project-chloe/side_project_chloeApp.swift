import SwiftUI

@main
struct side_project_chloeApp: App {
    
//    @StateObject private var dataController = DataController()
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
//                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
