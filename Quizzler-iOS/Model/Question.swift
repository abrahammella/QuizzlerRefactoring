//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Abraham Mella on 8/2/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation


struct Question {
    let questionText: String
    let answer: [String]
    let correctAnswer : String
    
    init(q: String, a: [String] , correctAnswer: String){
        self.questionText = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
    
}
