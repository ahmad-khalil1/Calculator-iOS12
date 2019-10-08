//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var isFinishedTybingNumber:Bool = true
    
    @IBOutlet weak var displayLabel: UILabel!
    // computed Prop
    private var displayValue : Double {
        get{
            guard let number = Double(displayLabel.text!) else {fatalError("Cannot convert display label text to a Double")}
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatingLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTybingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calcMode(Sympol: calcMethod) {
                displayValue = result
                
            }
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTybingNumber{
                displayLabel.text = numValue
                isFinishedTybingNumber = false
            }else{
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
    }
    
}

