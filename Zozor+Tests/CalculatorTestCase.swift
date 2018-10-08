//
//  CalculatorTestCase.swift
//  CountOnMeTests
//
//  Created by Thibault Dev on 27/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest

@testable import CountOnMe

class CalculatorTestCase: XCTestCase {
    
    var calculator: Calculator!
    var result: Int!
    override func setUp() {
        super.setUp()
        calculator = Calculator()
        result = calculator.calculateTotal()
    }
    
    func processCalulationOf(_ numberOne: Int, _ opereratedWith: String, _ numberTwo: Int) {
        calculator.addNewNumber(numberOne)
        calculator.addOperator(opereratedWith)
        calculator.addNewNumber(numberTwo)
    }
    
    func checkIfResultIsEqualTo(_ number: Int) {
        let result = calculator.calculateTotal()
        XCTAssertEqual(result, number)
    }
    
    func testGivenTheNumberArrayIsEmpty_WhenAddingTwo_ThenArrayShouldContainTwo(){
        calculator.stringNumbers = [String()]
        
        calculator.addNewNumber(2)
        
        XCTAssertTrue(calculator.stringNumbers == ["\(2)"])
    }
    
    func testGivenOperatorArrayWithPlusAndNuberArrayWith2_WhenAddingMinus_ThenOperatorArrayHasMinusAndStringNumbersHasBlank() {
        calculator.addNewNumber(2)
        calculator.operators = ["+"]
        
        calculator.addOperator("-")
        
        XCTAssertTrue(calculator.stringNumbers == ["\(2)", ""])
        XCTAssertTrue(calculator.operators == ["+", "-"])
    }
    
    func testGivenThatWeAdd3Plus2_WhenCalculatingResult_ThenTotalShouldBe5() {
        processCalulationOf(3, "+", 2)
        
        checkIfResultIsEqualTo(5)
    }
    
    func testGivenThatWeSubstract3Minus2_WhenCalculatingResult_ThenTotalShouldBe1() {
        processCalulationOf(3, "-", 2)
        
        checkIfResultIsEqualTo(1)
    }
    
    func testGivenThatWeMultiply3By2_WhenCalculatingResult_ThenTotalShouldBe6() {
        processCalulationOf(3, "*", 2)
        
        checkIfResultIsEqualTo(6)
    }
    
    func testGivenThatWeDivide3By2_WhenCalculatingResult_ThenTotalShouldBe1() {
        processCalulationOf(3, "/", 2)
        
        checkIfResultIsEqualTo(1)
    }
    
    func testGivenThatWeAdd3Plus2_WhenWeClearData_ThenArraysShouldBeReset() {
        processCalulationOf(3, "+", 2)
        
        calculator.clear()
        
        XCTAssertTrue(calculator.operators == ["+"])
        XCTAssertTrue(calculator.stringNumbers == [String()])
    }
    
    

    
}
