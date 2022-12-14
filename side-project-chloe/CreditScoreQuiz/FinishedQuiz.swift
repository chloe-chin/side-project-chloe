import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var quizGame: QuizGame
    var body: some View {
        VStack {
            Image(systemName: "graduationcap.fill")
                .foregroundColor(Color.teal)
                .font(.system(size: 60))
                .padding()
            
            QuizText(text: quizGame.model.quizWinningStatus ?
                         "you got all the questions right!" :
                            "head back to our learning modules to review!",
                         size: 20)
            .frame(width: UIScreen.main.bounds.size.width - 20, height: 80, alignment: .center)
            
            QuizText(text: quizGame.model.quizWinningStatus
                         ? "thanks for playing!"
                         : "better luck next time!",
                         size: 20)
            .frame(width: UIScreen.main.bounds.size.width - 20, height: 80, alignment: .center)
            
            Button {
                quizGame.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("play again")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.teal.opacity(0.7))
                .cornerRadius(30)
                .padding()
            
        }
    }
}
