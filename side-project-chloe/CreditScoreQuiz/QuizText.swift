import Foundation
import SwiftUI

struct QuizText: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size, weight: .bold))
            .foregroundColor(.black)
    }
}

