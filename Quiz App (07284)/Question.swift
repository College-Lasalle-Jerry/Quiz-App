//
//  Question.swift
//  Quiz App (07284)
//
//  Created by Jerry Joy on 2024-02-06.
//

import Foundation

struct Question {
    let text: String
    let answer: [String] // list of strings which will hold 3 choices for us.
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answer = a
        self.rightAnswer = correctAnswer
    } // we decalred the parameterised constructors.
}
