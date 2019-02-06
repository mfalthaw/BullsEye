//
//  ViewController.swift
//  BullsEye
//
//  Created by Moath on 2019-01-27.
//  Copyright © 2019 Moath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var rounds = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let alertTitle: String
        
        if(difference == 0){
            alertTitle = "Perfect!"
            points += 100
        } else if (points > 95){
            alertTitle = "You almost had it!"
            if(difference == 1){
                points += 50
            }
        } else if (points > 90){
            alertTitle = "Pretty good!"
        } else {
            alertTitle = "Not even close!"
        }
        score += points
    
        
        let message = "You scored \(points) points!"
        let alert = UIAlertController(title: alertTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = Int(slider.value.rounded())
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        rounds += 1
        updateLabels()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        pointsLabel.text = String(score)
        roundsLabel.text = String(rounds)
    }
}

