//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Andrey Mukhin on 23.11.2021.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(symbol: String) -> Double? {
        
        if symbol == "+/-" {
             return -number
        } else if symbol == "AC" {
            return 0
        } else if symbol == "%" {
            return number / 100
        }
        
        return nil
    }
}
