//
//  MultiplicationTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 29/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import XCTest

import RDHDecimalNumberOperations

class MultiplicationTests: XCTestCase {
    
    // MARK: - Infix
    
    func testPositiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() * NSDecimalNumber.one(), NSDecimalNumber.one().decimalNumberByMultiplyingBy(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(NSDecimalNumber.one() * NSDecimalNumber.zero(), NSDecimalNumber.one().decimalNumberByMultiplyingBy(NSDecimalNumber.zero()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        XCTAssertEqual(leftNumber * rightNumber, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber * leftNumber, rightNumber.decimalNumberByMultiplyingBy(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber * NSDecimalNumber.one(), leftNumber, "Should not change")
        XCTAssertEqual(leftNumber * NSDecimalNumber.zero(), NSDecimalNumber.zero(), "Should not change")
        
        XCTAssertEqual(NSDecimalNumber.zero() * NSDecimalNumber.zero(), NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne() * NSDecimalNumber.minusOne(), NSDecimalNumber.minusOne().decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        XCTAssertEqual(leftNumber * rightNumber, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber * leftNumber, rightNumber.decimalNumberByMultiplyingBy(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber * NSDecimalNumber.one(), leftNumber, "Should not change")
        XCTAssertEqual(leftNumber * NSDecimalNumber.zero(), NSDecimalNumber.zero(), "Should not change")
    }
    
    func testPostiveToNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() * NSDecimalNumber.minusOne(), NSDecimalNumber.one().decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        XCTAssertEqual(leftNumber * rightNumber, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber * leftNumber, rightNumber.decimalNumberByMultiplyingBy(leftNumber), "Incorrect")
    }
    
    func testNegativeToPostiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne() * NSDecimalNumber.one(), NSDecimalNumber.minusOne().decimalNumberByMultiplyingBy(NSDecimalNumber.one()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        XCTAssertEqual(leftNumber * rightNumber, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber * leftNumber, rightNumber.decimalNumberByMultiplyingBy(leftNumber), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignmentWithPositiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        var result = leftNumber
        
        result *= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        
        result *= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
        
        result *= NSDecimalNumber.zero()
        XCTAssertEqual(result, NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testAssignmentWithNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        var result = leftNumber
        
        result *= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        
        result *= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
        
        result *= NSDecimalNumber.zero()
        XCTAssertEqual(result, NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testAssignmentWithPostiveToNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        var result = leftNumber
        
        result *= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        
        result *= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
        
        result *= NSDecimalNumber.zero()
        XCTAssertEqual(result, NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testAssignmentWithNegativeToPostiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        var result = leftNumber
        
        result *= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberByMultiplyingBy(rightNumber), "Incorrect")
        
        result *= NSDecimalNumber.one()
        XCTAssertEqual(result, result, "Should not change")
        
        result *= NSDecimalNumber.zero()
        XCTAssertEqual(result, NSDecimalNumber.zero(), "Should be zero")
    }
}
