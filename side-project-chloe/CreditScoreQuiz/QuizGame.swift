import Foundation
import SwiftUI

class QuizGame : ObservableObject {
    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = QuizGame.createGameModel(i: QuizGame.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 50
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
                    if (QuizGame.currentIndex < 7) {
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
            
            QuizModel(question: "What is the highest credit score you can have?",
                      answer: "C",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "1000", color: Color.teal),
                                    QuizOption(id: 22,optionId: "B", option: "750", color: Color.teal),
                                    QuizOption(id: 23,optionId: "C", option: "850", color: Color.teal),
                                    QuizOption(id: 24,optionId: "D", option: "800", color: Color.teal)]),
            
            QuizModel(question: "Which debt is the easiest to accrue because of interest rates?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Credit Card", color: Color.teal),
                                    QuizOption(id: 32,optionId: "B", option: "Mortgage", color: Color.teal),
                                    QuizOption(id: 33,optionId: "C", option: "Car", color: Color.teal),
                                    QuizOption(id: 34,optionId: "D", option: "Personal Loan", color: Color.teal)]),
            
            QuizModel(question: "Which is not one of the 4 budgets?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "100/0", color: Color.teal),
                                    QuizOption(id: 32,optionId: "B", option: "80/20", color: Color.teal),
                                    QuizOption(id: 33,optionId: "C", option: "50/30/20", color: Color.teal),
                                    QuizOption(id: 34,optionId: "D", option: "0-Based", color: Color.teal)]),
            
            QuizModel(question: "How many months of income is a recommeded emergency fund?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "12 months", color: Color.teal),
                                    QuizOption(id: 32,optionId: "B", option: "3-6 months", color: Color.teal),
                                    QuizOption(id: 33,optionId: "C", option: "1 month", color: Color.teal),
                                    QuizOption(id: 34,optionId: "D", option: "1-4 months", color: Color.teal)]),
            
            QuizModel(question: "Should you create a savings before you pay off your debts?",
                      answer: "D",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Depends", color: Color.teal),
                                    QuizOption(id: 32,optionId: "B", option: "Of Course", color: Color.teal),
                                    QuizOption(id: 33,optionId: "C", option: "Not Sure", color: Color.teal),
                                    QuizOption(id: 34,optionId: "D", option: "No", color: Color.teal)]),
            
            QuizModel(question: "How much should your debt-to-credit percentage be?",
                      answer: "B",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "100%", color: Color.teal),
                                    QuizOption(id: 32,optionId: "B", option: "30%", color: Color.teal),
                                    QuizOption(id: 33,optionId: "C", option: "40%", color: Color.teal),
                                    QuizOption(id: 34,optionId: "D", option: "70%", color: Color.teal)]),
            
            QuizModel(question: "What is the average credit card interest?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "25%", color: Color.teal),
                                    QuizOption(id: 32,optionId: "B", option: "5%", color: Color.teal),
                                    QuizOption(id: 33,optionId: "C", option: "16%", color: Color.teal),
                                    QuizOption(id: 34,optionId: "D", option: "3%", color: Color.teal)])
            
        
            
        ]
    }
}
