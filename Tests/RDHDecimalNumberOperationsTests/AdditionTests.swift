//
//  AdditionTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 29/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import XCTest

import RDHDecimalNumberOperations

class AdditionTests: XCTestCase {
    
    // MARK: - Infix
    
    func testPositiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() + NSDecimalNumber.one(), NSDecimalNumber.one().decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        XCTAssertEqual(leftNumber + rightNumber, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber + leftNumber, rightNumber.decimalNumberByAdding(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber + NSDecimalNumber.zero(), leftNumber, "Should not change")
        
        XCTAssertEqual(NSDecimalNumber.zero() + NSDecimalNumber.zero(), NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne + NSDecimalNumber.minusOne, NSDecimalNumber.minusOne.decimalNumberByAdding(NSDecimalNumber.minusOne), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        XCTAssertEqual(leftNumber + rightNumber, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber + leftNumber, rightNumber.decimalNumberByAdding(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber + NSDecimalNumber.zero(), leftNumber, "Should not change")
    }
    
    func testPostiveToNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() + NSDecimalNumber.minusOne, NSDecimalNumber.one().decimalNumberByAdding(NSDecimalNumber.minusOne), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        XCTAssertEqual(leftNumber + rightNumber, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber + leftNumber, rightNumber.decimalNumberByAdding(leftNumber), "Incorrect")
    }
    
    func testNegativeToPostiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne + NSDecimalNumber.one(), NSDecimalNumber.minusOne.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        XCTAssertEqual(leftNumber + rightNumber, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber + leftNumber, rightNumber.decimalNumberByAdding(leftNumber), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignmentWithPositiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        var result = leftNumber
        
        result += rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        var result = leftNumber
        
        result += rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithPostiveToNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        var result = leftNumber
        
        result += rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithNegativeToPostiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        var result = leftNumber
        
        result += rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByAdding(rightNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    // MARK: - Prefix
    
    func testPrefixWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "34")
        var incrementing = value
        let result = ++incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    func testPrefixWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-383")
        var incrementing = value
        let result = ++incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    // MARK: - Suffix
    
    func testSuffixWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "234")
        var incrementing = value
        let result = incrementing++
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value, "Incorrect")
        XCTAssertNotEqual(result, incrementing, "Incorrect")
        XCTAssertEqual(result.decimalNumberByAdding(NSDecimalNumber.one()), incrementing, "Incorrect")
    }
    
    func testSuffixWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-4358")
        var incrementing = value
        let result = incrementing++
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value, "Incorrect")
        XCTAssertNotEqual(result, incrementing, "Incorrect")
        XCTAssertEqual(result.decimalNumberByAdding(NSDecimalNumber.one()), incrementing, "Incorrect")
    }
    
    // MARK: - Overflow
    
    func testOverflow() {
        let leftNumber = NSDecimalNumber.maximumDecimalNumber()
        let rightNumber = NSDecimalNumber.maximumDecimalNumber()
                
        XCTAssertEqual(leftNumber &+ rightNumber, NSDecimalNumber.notANumber(), "Should not throw an exception and be NaN")
    }
    
    func testLossOfPrecision() {
        let leftNumber = NSDecimalNumber.maximumDecimalNumber()
        let rightNumber = NSDecimalNumber.one() / NSDecimalNumber(string: "3")
        
        // As adding more significate digits to the end of the biggest number will increase the size of the 38 allowed significate digits
        XCTAssertEqual(leftNumber &+ rightNumber, leftNumber, "Should not throw an exception and be NaN")
    }
}
