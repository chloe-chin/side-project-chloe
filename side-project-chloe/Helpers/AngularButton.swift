import SwiftUI

struct AngularButton: View {
    var title = ""
    @State var tap = false
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var body: some View {
        Text(completedLongPress ? "Loading..." : title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, maxHeight: 50)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.linearGradient(colors: [.white.opacity(0.8), .black.opacity(0.2)], startPoint: .top, endPoint: .bottom))
                    .blendMode(.overlay)
            )
            .frame(height: 50)
            .accentColor(.primary.opacity(0.7))
            .background(.white.opacity(0.5))
            .cornerRadius(20)
            .scaleEffect(isDetectingLongPress ? 0.8 : 1)
    }
}

