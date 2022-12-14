import Foundation
import SwiftUI

class QuizGame : ObservableObject {
    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = QuizGame.createGameModel(i: QuizGame.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (QuizGame.currentIndex < 2) {
                        QuizGame.currentIndex = QuizGame.currentIndex + 1
                        self.model = QuizGame.createGameModel(i: QuizGame.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }

        }
    }
    
    func restartGame() {
        QuizGame.currentIndex = 0
        model = QuizGame.createGameModel(i: QuizGame.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
                                     
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
}
extension QuizGame {
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "How many categories make up your credit score?",
                      answer: "B",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "4", color: Color.teal),
                                    QuizOption(id: 12,optionId: "B", option: "5", color: Color.teal),
                                    QuizOption(id: 13,optionId: "C", option: "6", color: Color.teal),
                                    QuizOption(id: 14,optionId: "D", option: "7", color: Color.teal)]),
            
            QuizModel(question: "Which two categories have the highest impact on your credit score?",
                      answer: "C",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "Sea Lion", color: Color.teal),
                                    QuizOption(id: 22,optionId: "B", option: "Sea Urchin", color: Color.teal),
                                    QuizOption(id: 23,optionId: "C", option: "Seahorse", color: Color.teal),
                                    QuizOption(id: 24,optionId: "D", option: "Sea slug", color: Color.teal)]),
            
            QuizModel(question: "Which is the world largest living fish?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Manta Ray", color: Color.teal),
                                    QuizOption(id: 32,optionId: "B", option: "Whale Shark", color: Color.teal),
                                    QuizOption(id: 33,optionId: "C", option: "Marlin", color: Color.teal),
                                    QuizOption(id: 34,optionId: "D", option: "Sailfish", color: Color.teal)])
        ]
    }
}
