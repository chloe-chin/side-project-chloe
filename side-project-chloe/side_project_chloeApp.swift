import SwiftUI

@main
struct side_project_chloeApp: App {
    
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
