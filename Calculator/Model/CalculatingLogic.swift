//
//  CalculatingLogic.swift
//  Calculator
//
//  Created by ahmad$$ on 10/7/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

struct CalculatingLogic {
    
    private var number : Double?
    
    private var intermediatCalc : (n1 : Double , calcMethod : String )?
    
    mutating func setNumber(_ number:Double){
        self.number = number
    }
    
    mutating func calcMode(Sympol:String) -> Double? {
        if let n = number {
            switch Sympol {
            case "+/-" :
                return n * -1
            case "AC" :
                return 0
            case "%" :
                return n * 0.01
            case "=" : return performCalculation(n2: n)
            
            default:
                self.intermediatCalc = ( n , Sympol )

            }
        }
        return nil
    }
    
    private func performCalculation(n2:Double) -> Double? {
        if let n1 = intermediatCalc?.n1 ,let operation = intermediatCalc?.calcMethod {
            switch operation {
            case "+" : return n1 + n2
            case "×" : return n1 * n2
            case "÷" : return n1 / n2
            case "-" : return n1 - n2
            default : fatalError("this is a wrong operation")
            }
            
        }
        return nil
    }
}
