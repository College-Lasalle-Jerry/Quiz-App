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
    
    // buttons (IB Outlets)
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    
    
    var quiz = Quiz() // initialise
    
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // we will explicitily set the border for the button.
        // Choice 1
        choice1.layer.cornerRadius = 25
        choice1.layer.borderWidth = 2
        choice1.layer.borderColor = UIColor.gray.cgColor
        
        // Choice 2
        choice2.layer.cornerRadius = 25
        choice2.layer.borderWidth = 2
        choice2.layer.borderColor = UIColor.gray.cgColor
        
        // choice 3
        choice3.layer.cornerRadius = 25
        choice3.layer.borderWidth = 2
        choice3.layer.borderColor = UIColor.gray.cgColor

        
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
        
        let choices = quiz.getAnswers()
        // this will fetch the list of choices we have, for that current question
        
        choice1.setTitle(choices[0], for: .normal)
        choice2.setTitle(choices[1], for: .normal)
        choice3.setTitle(choices[2], for: .normal)
        
        // change the color of the button
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
    }
    
    
    
}

