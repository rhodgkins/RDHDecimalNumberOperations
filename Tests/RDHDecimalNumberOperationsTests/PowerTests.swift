//
//  PowerTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 29/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import XCTest

import RDHDecimalNumberOperations

class PowerTests: XCTestCase {
    
    // MARK: - Infix
    
    func testSpecialCases() {

        // 0 ^ 0 == 1
        XCTAssertEqual(NSDecimalNumber.zero() ** 0, NSDecimalNumber.zero().decimalNumberByRaisingToPower(0), "Incorrect")
        XCTAssertEqual(NSDecimalNumber.zero() ^ 0, NSDecimalNumber.zero().decimalNumberByRaisingToPower(0), "Incorrect")
        
        // 0 ^ 1 == 0
        XCTAssertEqual(NSDecimalNumber.zero() ** 1, NSDecimalNumber.zero().decimalNumberByRaisingToPower(1), "Incorrect")
        XCTAssertEqual(NSDecimalNumber.zero() ^ 1, NSDecimalNumber.zero().decimalNumberByRaisingToPower(1), "Incorrect")
        
        // 0 ^ -1 == 0
        XCTAssertEqual(NSDecimalNumber.zero() ** -1, NSDecimalNumber.zero().decimalNumberByRaisingToPower(-1), "Incorrect")
        XCTAssertEqual(NSDecimalNumber.zero() ^ -1, NSDecimalNumber.zero().decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    func testPostiveNumbers() {
        let number = NSDecimalNumber(string: "4")
        let power = 6
        
        XCTAssertEqual(number ** power, number.decimalNumberByRaisingToPower(power), "Incorrect")
        XCTAssertEqual(number ^ power, number.decimalNumberByRaisingToPower(power), "Incorrect")
        
        XCTAssertEqual(NSDecimalNumber.one() ** -1, NSDecimalNumber.one().decimalNumberByRaisingToPower(-1), "Incorrect")
        XCTAssertEqual(NSDecimalNumber.one() ^ -1, NSDecimalNumber.one().decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    func testNegativeNumbers() {
        let number = NSDecimalNumber(string: "-8")
        let power = 8
        
        XCTAssertEqual(number ** power, number.decimalNumberByRaisingToPower(power), "Incorrect")
        XCTAssertEqual(number ^ power, number.decimalNumberByRaisingToPower(power), "Incorrect")
        
        XCTAssertEqual(NSDecimalNumber.minusOne ** -1, NSDecimalNumber.minusOne.decimalNumberByRaisingToPower(-1), "Incorrect")
        XCTAssertEqual(NSDecimalNumber.minusOne ^ -1, NSDecimalNumber.minusOne.decimalNumberByRaisingToPower(-1), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignmentWithPostiveNumbers() {
        let number = NSDecimalNumber(string: "4")
        let power = 6
        
        var result1 = number
        var result2 = number
        result1 **= power
        result2 ^= power
        
        XCTAssertEqual(result1, number.decimalNumberByRaisingToPower(power), "Incorrect")
        XCTAssertEqual(result2, number.decimalNumberByRaisingToPower(power), "Incorrect")
        XCTAssertEqual(result1, result2, "Incorrect")
        
        result1 = NSDecimalNumber.one()
        result2 = NSDecimalNumber.one()
        result1 **= -1
        result2 ^= -1
        
        XCTAssertEqual(result1, NSDecimalNumber.one().decimalNumberByRaisingToPower(-1), "Incorrect")
        XCTAssertEqual(result2, NSDecimalNumber.one().decimalNumberByRaisingToPower(-1), "Incorrect")
        XCTAssertEqual(result1, result2, "Incorrect")
    }
    
    func testAssignmentWithNegativeNumbers() {
        
        let number = NSDecimalNumber(string: "-8")
        let power = 8
        
        var result1 = number
        var result2 = number
        result1 **= power
        result2 ^= power
        
        XCTAssertEqual(result1, number.decimalNumberByRaisingToPower(power), "Incorrect")
        XCTAssertEqual(result2, number.decimalNumberByRaisingToPower(power), "Incorrect")
        XCTAssertEqual(result1, result2, "Incorrect")
        
        result1 = NSDecimalNumber.minusOne
        result2 = NSDecimalNumber.minusOne
        result1 **= -1
        result2 ^= -1
        
        XCTAssertEqual(result1, NSDecimalNumber.minusOne.decimalNumberByRaisingToPower(-1), "Incorrect")
        XCTAssertEqual(result2, NSDecimalNumber.minusOne.decimalNumberByRaisingToPower(-1), "Incorrect")
        XCTAssertEqual(result1, result2, "Incorrect")
    }
}
