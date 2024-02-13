//
//  Quiz.swift
//  Quiz App (07284)
//
//  Created by Jerry Joy on 2024-02-06.
//

import Foundation


struct Quiz {
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ] // replaced the entire question set.

    // question number and score
    
    var questionNumber = 0
    var score = 0
    

    // MARK: Methods
    
    // To update the questionNumber
    mutating func nextQuestion( ){
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }else{
            questionNumber = 0 // resetting the quiz
            score = 0
        }
    }
    
    // Check answer and update score
    mutating func checkAnswer(userAnswer: String)-> Bool {
        if userAnswer == quiz[questionNumber].rightAnswer { // replaced with rightAnswer. > .answer -> .rightAnswer
            score += 1
            return true
        }else{
            return false
        }
    }
    
    // To update the progress view
    func getProgess() -> Float {
        return Float(questionNumber+1)/Float(quiz.count)
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answer
    } // To the list of answers for a particular question.
}
