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
                displayLabel.text = String(newValue)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        numberArray = []
        if let calcMethod = sender.currentTitle {
            let calculator = CalculatorLogic(number: displayValue)
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("The result of a calculation is nill")
            }
            displayValue = result
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
