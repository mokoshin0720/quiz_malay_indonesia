//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by 金城信哉 on 2020/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNumber = 0
    var score = 0
    
    //問題と正解不正解の定義付け
    let quiz = [
          Question(q: "Saya = me", a: "True"),
          Question(q: "bagus = good", a: "True"),
          Question(q: "enak = delicious", a: "True"),
          Question(q: "1 = dua", a: "False"),
          Question(q: "suka = sukiyaki", a: "False"),
          Question(q: "tinggal = live", a: "True"),
          Question(q: "bermain = mine", a: "False"),
          Question(q: "suasana = atomosphere", a: "True"),
          Question(q: "berenang = hang out", a: "False"),
          Question(q: "panas = hot", a: "True"),
          Question(q: "nasi = rice", a: "True")
      ]
    
    //今の問題のテキストを取得
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //進行バーの数値設定
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    //スコアを返す
    mutating func getScore() -> Int {
        return score
    }
    
    //次の問題に進む処理
     mutating func nextQuestion() {
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    //正解or不正解だった時のスコアの処理
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
}
