//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var player: AVAudioPlayer!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        //バーの初期値を0.0に設定
        progressBar.progress = 0.0
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //「正しい」or「間違い」の選択した方をuserAnswerに格納
        let userAnswer = sender.currentTitle!
        //答えが正解かどうかをTrueFalseで返す
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        print(sender.titleLabel!)
        
        
        if userGotItRight { //もし答えが正解ならば
            sender.backgroundColor = UIColor.green
            playSoundCorrect()
        } else { //もし答えが間違いならば
            sender.backgroundColor = UIColor.red
            playSoundWrong()
        }
        
        
        quizBrain.nextQuestion()
        
        //ボタンが押された0.2秒後にupdateUI()を呼び出す
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    //ボタンが押された後の処理
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    //正解音を鳴らす処理
    func playSoundCorrect() {
        let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    //不正解音を鳴らす処理
    func playSoundWrong() {
        let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}

