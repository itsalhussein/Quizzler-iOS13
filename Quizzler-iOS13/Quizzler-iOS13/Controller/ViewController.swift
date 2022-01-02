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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotIt = quizBrain.checkAnswer(userAnswer)
        
        if userGotIt {
            sender.backgroundColor = UIColor.green

        } else {
            sender.backgroundColor = UIColor.red

        }
        
        quizBrain.nextQuestion()
 
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
            sender.backgroundColor = UIColor.clear
            self.updateUI()
            
        }
      
       
    }
    
    
    
    func updateUI (){
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()

    }
    
    
     
}

