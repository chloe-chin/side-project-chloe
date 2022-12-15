import SwiftUI
import LocalAuthentication

class LockViewModel: ObservableObject{
    @Published var isUnlocked: Bool = false
    @Published var isAvailable: Bool = true
    
    func authenticateUser(){
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Security To Hide Privacy Contents From Others") { status, _ in
                DispatchQueue.main.async {
                    self.isUnlocked = status
                }
            }
        }else{
            isAvailable = false
            isUnlocked = false
        }
    }
}
