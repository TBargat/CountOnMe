//
//  Calculator.swift
//  CountOnMe
//
//  Created by Thibault Dev on 24/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import Foundation

class Calculator {
    
    // MARK : - Properties
    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var previousResult = 0
    
    // MARK : - Methods
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
    }
    
    func calculateTotal() -> Int {
        var total = 0
        for (i, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                switch operators[i] {
                case "+":
                    total += number
                case "-":
                    total -= number
                case "*":
                    total *= number
                case "/":
                    total /= number
                default:
                    break
                }
            }
        }
        return total
    }
    
    func addNewNumber(_ newNumber: Int) {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
    }
    
    func addOperator(_ newOperator: String) {
        operators.append(newOperator)
        stringNumbers.append("")
    }
    
  
   
}


