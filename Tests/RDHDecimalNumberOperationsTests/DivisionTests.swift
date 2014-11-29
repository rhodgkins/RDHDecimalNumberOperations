//
//  DivisionTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 29/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import XCTest

import RDHDecimalNumberOperations

class DivisionTests: XCTestCase {
    
    // MARK: - Infix
    
    func testPositiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() / NSDecimalNumber.one(), NSDecimalNumber.one().decimalNumberByDividingBy(NSDecimalNumber.one()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        XCTAssertEqual(leftNumber / rightNumber, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber / leftNumber, rightNumber.decimalNumberByDividingBy(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber / NSDecimalNumber.one(), leftNumber, "Should not change")
        
        XCTAssertEqual(NSDecimalNumber.zero() / NSDecimalNumber.one(), NSDecimalNumber.zero(), "Should be zero")
        XCTAssertEqual(NSDecimalNumber.one() / NSDecimalNumber.one(), NSDecimalNumber.one(), "Should be zero")
    }
    
    func testNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne / NSDecimalNumber.minusOne, NSDecimalNumber.minusOne.decimalNumberByDividingBy(NSDecimalNumber.minusOne), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        XCTAssertEqual(leftNumber / rightNumber, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber / leftNumber, rightNumber.decimalNumberByDividingBy(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber / NSDecimalNumber.one(), leftNumber, "Should not change")
    }
    
    func testPostiveToNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() / NSDecimalNumber.minusOne, NSDecimalNumber.one().decimalNumberByDividingBy(NSDecimalNumber.minusOne), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        XCTAssertEqual(leftNumber / rightNumber, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber / leftNumber, rightNumber.decimalNumberByDividingBy(leftNumber), "Incorrect")
    }
    
    func testNegativeToPostiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne / NSDecimalNumber.one(), NSDecimalNumber.minusOne.decimalNumberByDividingBy(NSDecimalNumber.one()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        XCTAssertEqual(leftNumber / rightNumber, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber / leftNumber, rightNumber.decimalNumberByDividingBy(leftNumber), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignmentWithPositiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        var result = leftNumber
        
        result /= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        
        result /= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        var result = leftNumber
        
        result /= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        
        result /= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithPostiveToNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        var result = leftNumber
        
        result /= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        
        result /= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithNegativeToPostiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        var result = leftNumber
        
        result /= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByDividingBy(rightNumber), "Incorrect")
        
        result /= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    // MARK: - Overflow
    
    func testDividingByZero() {
        let leftNumber = NSDecimalNumber.one()
        let rightNumber = NSDecimalNumber.zero()
        
        XCTAssertEqual(leftNumber &/ rightNumber, NSDecimalNumber.notANumber(), "Should not throw an exception and be NaN")
    }
    
    func testUnderflow() {
        let leftNumber = NSDecimalNumber.one()
        let rightNumber = NSDecimalNumber.maximumDecimalNumber()
        
        XCTAssertEqual(leftNumber &/ rightNumber, NSDecimalNumber.notANumber(), "Should not throw an exception and be NaN")
    }
}
