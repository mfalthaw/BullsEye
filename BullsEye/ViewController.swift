//
//  ViewController.swift
//  BullsEye
//
//  Created by Moath on 2019-01-27.
//  Copyright © 2019 Moath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello, World!", message: String(currentValue), preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = Int(slider.value)
        print("The value of the slider is now: \(currentValue)")
    }
}

