//
//  PowerTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 29/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import Foundation

#if os(watchOS)
// No testing supported
@testable import RDHDecimalNumberOperations
#else
    
import XCTest
    
#if DEBUG
@testable import RDHDecimalNumberOperations
#else
import RDHDecimalNumberOperations
#endif

class PowerTests: XCTestCase {
    
    // MARK: - Infix
    
    func testSpecialCases() {

        // 0 ^ 0 == 1
        XCTAssertEqual(NSDecimalNumber.zero() ** 0, NSDecimalNumber.zero().decimalNumberByRaisingToPower(0), "Incorrect")
        
        // 0 ^ 1 == 0
        XCTAssertEqual(NSDecimalNumber.zero() ** 1, NSDecimalNumber.zero().decimalNumberByRaisingToPower(1), "Incorrect")
        
        // 0 ^ -1 == 0
        XCTAssertEqual(NSDecimalNumber.zero() ** -1, NSDecimalNumber.zero().decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    func testPostiveNumbers() {
        let number = NSDecimalNumber(string: "4")
        let power = 6
        
        XCTAssertEqual(number ** power, number.decimalNumberByRaisingToPower(power), "Incorrect")
        
        XCTAssertEqual(NSDecimalNumber.one() ** -1, NSDecimalNumber.one().decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    func testNegativeNumbers() {
        let number = NSDecimalNumber(string: "-8")
        let power = 8
        
        XCTAssertEqual(number ** power, number.decimalNumberByRaisingToPower(power), "Incorrect")
        
        XCTAssertEqual(NSDecimalNumber.minusOne ** -1, NSDecimalNumber.minusOne.decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    func testWithUnaryNegationOperator() {
        
        // -3^2 should equal -9 but unary - has higher precedence than exponents (http://en.wikipedia.org/wiki/Order_of_operations#Exceptions_to_the_standard)
        
        let three = NSDecimalNumber(string: "3")
        
        var value = -three**2
        XCTAssertEqual(value, NSDecimalNumber(string: "9"), "Incorrect")
        XCTAssertNotEqual(value, NSDecimalNumber(string: "-9"), "Incorrect")

        value = -(three ** 2)
        XCTAssertEqual(value, NSDecimalNumber(string: "-9"), "Incorrect")
        XCTAssertNotEqual(value, NSDecimalNumber(string: "9"), "Incorrect")
        
        value = NSDecimalNumber.zero() - three**2
        XCTAssertEqual(value, NSDecimalNumber(string: "-9"), "Incorrect")
        XCTAssertNotEqual(value, NSDecimalNumber(string: "9"), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignmentWithPostiveNumbers() {
        let number = NSDecimalNumber(string: "4")
        let power = 6
        
        var result = number
        result **= power
        
        XCTAssertEqual(result, number.decimalNumberByRaisingToPower(power), "Incorrect")
        
        result = NSDecimalNumber.one()
        result **= -1
        
        XCTAssertEqual(result, NSDecimalNumber.one().decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    func testAssignmentWithNegativeNumbers() {
        
        let number = NSDecimalNumber(string: "-8")
        let power = 8
        
        var result = number
        result **= power
        
        XCTAssertEqual(result, number.decimalNumberByRaisingToPower(power), "Incorrect")
        
        result = NSDecimalNumber.one()
        result **= -1
        
        XCTAssertEqual(result, NSDecimalNumber.one().decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    // MARK: - Overflow
    
    func testOverflow() {
        
        XCTAssertEqual(NSDecimalNumber.maximumDecimalNumber() &** 2, NSDecimalNumber.notANumber(), "Incorrect")
    }
}

#endif
