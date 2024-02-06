//
//  ViewController.swift
//  Quiz App (07284)
//
//  Created by Jerry Joy on 2024-02-06.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var progressView: UIProgressView!
    
    // buttons
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var quiz = Quiz() // initialise
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // we will explicitily set the border for the button.
        trueButton.layer.cornerRadius = 25
        trueButton.layer.borderWidth = 2
        trueButton.layer.borderColor = UIColor.gray.cgColor
        
        // false button
        falseButton.layer.cornerRadius = 25
        falseButton.layer.borderWidth = 2
        falseButton.layer.borderColor = UIColor.gray.cgColor
        
        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        timer.invalidate()
        let answer = sender.currentTitle
        if quiz.checkAnswer(userAnswer: answer!){
            print("Answer is Correct!")
            sender.backgroundColor = UIColor.green
        }else{
            print("Answer is Incorrect")
            sender.backgroundColor = UIColor.red
        }
        quiz.nextQuestion()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){
            (_) in
            self.updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = quiz.getQuestionText()
        scoreLabel.text = "Score: \(quiz.getScore())"
        progressView.progress = quiz.getProgess() // Update the progess.
        
        // change the color of the button
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
    
    
}

