//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 金城信哉 on 2020/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    //textとanswerををq,aと初期化
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
