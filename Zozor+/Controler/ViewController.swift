//
//  ViewController.swift
//  CountOnMe
//
//  Created by Ambroise COLLON on 30/08/2016.
//  Copyright © 2016 Ambroise Collon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    // MARK: - Properties
    
    var calculator = Calculator()
    
    // Property used to check if an xpression is correct or not
    var isExpressionCorrect: Bool {
        if let stringNumber = calculator.stringNumbers.last {
            if stringNumber.isEmpty {
                if calculator.stringNumbers.count == 1 {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                } else {
                    let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
                    alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alertVC, animated: true, completion: nil)
                }
                return false
            }
        }
        return true
    }

    // Property used to validate or not the use of a new operator in the current expression
    var canAddOperator: Bool {
        if let stringNumber = calculator.stringNumbers.last {
            if stringNumber.isEmpty {
                let alertVC = UIAlertController(title: "Zéro!", message: "Expression incorrecte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }
    
    // Property used to check if the user is dividing or not by 0
    var cantDivideByZero: Bool {
        if let lastOperator = calculator.operators.last {
            if lastOperator == "/" {
                let alertVC = UIAlertController(title: "Erreur!", message: "Il est impossible de diviser par 0", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
                return false
            }
        }
        return true
    }

    
    // MARK: - Outlets

    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!

    // MARK: - Action

    @IBAction func tappedNumberButton(_ sender: UIButton) {
        for (i, numberButton) in numberButtons.enumerated() {
            if sender == numberButton {
                if i == 0 && !cantDivideByZero {
                    
                } else {
                 numberAddedToDisplay(i)
                }
            }
        }
    }

    @IBAction func plus() {
        if canAddOperator {
            calculator.addOperator("+")
            updateDisplay()
        }
    }

    @IBAction func minus() {
        if canAddOperator {
            calculator.addOperator("-")
            updateDisplay()
        }
    }
    
    @IBAction func multiply() {
        if canAddOperator {
            calculator.addOperator("*")
            updateDisplay()
        }
    }
    
    @IBAction func divide() {
        if canAddOperator {
            calculator.addOperator("/")
            updateDisplay()
        }
    }
    
    @IBAction func usePreviousResult() {
        numberAddedToDisplay(calculator.previousResult)
    }
    
    @IBAction func equal() {
        getResult()
    }

    
    // MARK: - Methods
    
    func numberAddedToDisplay(_ number: Int) {
        calculator.addNewNumber(number)
        updateDisplay()
    }

    func getResult() {
        if !isExpressionCorrect {
            return
        }
        let result = calculator.calculateTotal()
        textView.text = textView.text + "=\(result)"
        calculator.previousResult = result
        calculator.clear()
    }

    func updateDisplay() {
        var text = ""
        for (i, stringNumber) in calculator.stringNumbers.enumerated() {
            // Add operator
            if i > 0 {
                text += calculator.operators[i]
            }
            // Add number
            text += stringNumber
        }
        textView.text = text
    }

}
