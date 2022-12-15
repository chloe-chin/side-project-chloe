import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Home", icon: "house", color: .teal, selection: .home),
    TabItem(name: "Learn", icon: "text.book.closed.fill", color: .teal, selection: .learn),
    TabItem(name: "Profile", icon: "person.fill", color: .teal, selection: .profile)
]

enum Tab: String {
    case home
    case learn
    case profile
}

