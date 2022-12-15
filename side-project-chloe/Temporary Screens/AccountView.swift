import SwiftUI

struct AccountView: View {
    @State var isPinned = false
    @State var isDeleted = false
    
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isLogged") var isLogged = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    profile
                }
                
                Section {
                    NavigationLink {} label: {
                        Label("Settings", systemImage: "gear")
                    }
                }
                .listRowSeparator(.automatic)
                
                Button {} label: {
                    Text("Sign out")
                        .frame(maxWidth: .infinity)
                }
                .tint(.red)
                .onTapGesture {
                    isLogged = false
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Account")

        }
    }
    
    var profile: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3), .red)
                .font(.system(size: 32))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
            Text("Chloe Chin")
                .font(.title.weight(.semibold))

        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
    

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}


