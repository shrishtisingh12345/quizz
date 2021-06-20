//
//  allquestion.swift
//  Quiz
//
//  Created by shrishti singh on 13/06/21.
//

import Foundation

class Question {
    let questiontext : String
    let ans : Bool
    init(text : String , correctAnswer : Bool){
        questiontext = text
        ans = correctAnswer
    }
    
}

