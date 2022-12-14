import SwiftUI

struct QuizView: View {
    @ObservedObject var quizGame: QuizGame
    var body: some View {
        ZStack {
            Image("Background 4")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .ignoresSafeArea()
            
            if (quizGame.model.quizCompleted) {
                QuizCompletedView(quizGame: quizGame)
            } else {
                VStack(alignment: .center, spacing: 20) {

                    QuizText(text: "Test your knowledge!", size: 30)
                    
                    QuizText(text: quizGame.model.quizModel.question, size: 20)
                        .lineLimit(3)
                        .frame(width: UIScreen.main.bounds.size.width - 20, height: 80, alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    
                    ZStack {
                        Circle()
                            .stroke(lineWidth: 15)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                        
                        
                        Circle()
                            .trim(from: 0.0, to: min(CGFloat((Double(quizGame.progress) * Double(quizGame.maxProgress))/100),1.0))
                            .stroke(LinearGradient(colors: [.green, .teal, .blue],
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing),
                                    style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                            .rotationEffect(Angle(degrees: 270))
                            .animation(Animation.linear(duration: Double(quizGame.maxProgress)), value: quizGame.progress)
                        
                        QuizText(text: String(quizGame.progress), size: 30)
                    }.frame(width: 100, height: 150)
                    
                    
                    QuizGrid(quizGame: quizGame)
                }

            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView(quizGame: QuizGame())
    }
}

