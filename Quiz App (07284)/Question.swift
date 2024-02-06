//
//  Question.swift
//  Quiz App (07284)
//
//  Created by Jerry Joy on 2024-02-06.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}
