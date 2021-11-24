//
//  ViewController.swift
//  Calculator
//
//  Created by Andrey Mukhin on 22.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    private var numberArray = [String]()
    private var displayValue: Double {
        get {
            guard let currentDisplayValue = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label to a Double!")
            }
            return Double(currentDisplayValue)
        }
        set {
            if newValue.isInteger {
                displayLabel.text = String(Int(newValue))
            } else {
                if newValue.isCanonical {
                    displayLabel.text = String(format: "%.9f", newValue)
                } else {
                    displayLabel.text = String(newValue)
                }
                
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        numberArray = []
        if let calcMethod = sender.currentTitle {
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if numValue == "." {
                
                let isInt = floor(displayValue) == displayValue
                if !isInt {
                    return
                } else {
                    numberArray.append(numValue)
                }
            } else {
                numberArray.append(numValue)
            }
            displayLabel.text = numberArray.joined()
        }
    }
    
}

extension FloatingPoint {
  var isInteger: Bool { rounded() == self }
}
