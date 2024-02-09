//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    @IBOutlet weak var secondChoiceButton: UIButton!
    @IBOutlet weak var thirdChoiceButton: UIButton!
    
    
    var quizBrain  = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    
    @IBAction func answersButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        sender.backgroundColor = userGotItRight ? UIColor.green : UIColor.red
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func fillAnswerButtonText(_ quizAnswers: [String]){
        firstChoiceButton.setTitle(quizAnswers[0], for: .normal)
        secondChoiceButton.setTitle(quizAnswers[1], for: .normal)
        thirdChoiceButton.setTitle(quizAnswers[2], for: .normal)
    }
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = quizBrain.getUserScore()
        fillAnswerButtonText(quizBrain.getQuestionAnswers())
        
        progressBar.progress = quizBrain.getProgressBar()
        [firstChoiceButton, secondChoiceButton, thirdChoiceButton].forEach {
            $0?.backgroundColor = .clear
        }
    }
}

