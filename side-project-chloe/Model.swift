import SwiftUI
import Combine

class Model: ObservableObject {
    @Published var showTab: Bool = true
    @Published var showNav: Bool = true
    @Published var selectedModal: Modal = .signUp
    @Published var showModal: Bool = false
    @Published var dismissModal: Bool = false
    @Published var showDetail: Bool = false
    @Published var selectedCourse: Int = 0
}

enum Modal: String {
    case signUp
    case signIn
}
