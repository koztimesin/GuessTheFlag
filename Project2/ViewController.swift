//
//  ViewController.swift
//  Project2
//
//  Created by Karthus Saffron on 7/1/22.
//  Copyright © 2022 koztimesin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var question = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var msg: String
        var action_title = "Continue"
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            msg = "Your score is \(score)"
        } else {
            title = "Wrong"
            score -= 1
            msg = """
            Oops... That's the flag of \(countries[sender.tag].uppercased())
            Your score is \(score)
            """
        }
        question += 1
        if (question == 10) {
            title = "Game over"
            msg = "Your total score \(score)"
            action_title = "Play again"
            question = 1
            score = 0
        }
        
        let ac = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: action_title, style: .default, handler: askQuestion)
        
        ac.addAction(action)
        
        present(ac, animated: true)
    }
    
}

