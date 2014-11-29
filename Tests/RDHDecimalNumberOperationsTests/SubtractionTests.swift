//
//  SubtractionTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 29/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import XCTest

import RDHDecimalNumberOperations

class SubtractionTests: XCTestCase {
    
    // MARK: - Infix
    
    func testPositiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() - NSDecimalNumber.one(), NSDecimalNumber.one().decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        XCTAssertEqual(leftNumber - rightNumber, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber - leftNumber, rightNumber.decimalNumberBySubtracting(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber - NSDecimalNumber.zero(), leftNumber, "Should not change")
        
        XCTAssertEqual(NSDecimalNumber.zero() - NSDecimalNumber.zero(), NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne - NSDecimalNumber.minusOne, NSDecimalNumber.minusOne.decimalNumberBySubtracting(NSDecimalNumber.minusOne), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        XCTAssertEqual(leftNumber - rightNumber, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber - leftNumber, rightNumber.decimalNumberBySubtracting(leftNumber), "Incorrect")
        
        XCTAssertEqual(leftNumber - NSDecimalNumber.zero(), leftNumber, "Should not change")
    }
    
    func testPostiveToNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() - NSDecimalNumber.minusOne, NSDecimalNumber.one().decimalNumberBySubtracting(NSDecimalNumber.minusOne), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        XCTAssertEqual(leftNumber - rightNumber, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber - leftNumber, rightNumber.decimalNumberBySubtracting(leftNumber), "Incorrect")
    }
    
    func testNegativeToPostiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne - NSDecimalNumber.one(), NSDecimalNumber.minusOne.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        XCTAssertEqual(leftNumber - rightNumber, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightNumber - leftNumber, rightNumber.decimalNumberBySubtracting(leftNumber), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignmentWithPositiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "4")
        let rightNumber = NSDecimalNumber(string: "6.5")
        
        var result = leftNumber
        
        result -= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-8")
        let rightNumber = NSDecimalNumber(string: "-7.9")
        
        var result = leftNumber
        
        result -= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithPostiveToNegativeNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "12")
        let rightNumber = NSDecimalNumber(string: "-90.1")
        
        var result = leftNumber
        
        result -= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignmentWithNegativeToPostiveNumbers() {
        
        let leftNumber = NSDecimalNumber(string: "-12122.32")
        let rightNumber = NSDecimalNumber(string: "23")
        
        var result = leftNumber
        
        result -= rightNumber
        XCTAssertEqual(result, leftNumber.decimalNumberBySubtracting(rightNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    // MARK: - Prefix
    
    func testPrefixWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "34")
        var incrementing = value
        var result = --incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    func testPrefixWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-383")
        var incrementing = value
        var result = --incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    // MARK: - Suffix
    
    func testSuffixWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "234")
        var incrementing = value
        var result = incrementing--
        
        XCTAssertEqual(incrementing, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value, "Incorrect")
        XCTAssertNotEqual(result, incrementing, "Incorrect")
        XCTAssertEqual(result.decimalNumberBySubtracting(NSDecimalNumber.one()), incrementing, "Incorrect")
    }
    
    func testSuffixWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-4358")
        var incrementing = value
        var result = incrementing--
        
        XCTAssertEqual(incrementing, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value, "Incorrect")
        XCTAssertNotEqual(result, incrementing, "Incorrect")
        XCTAssertEqual(result.decimalNumberBySubtracting(NSDecimalNumber.one()), incrementing, "Incorrect")
    }
    
    // MARK: - Unary negation
    
    func testNegationWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "9351.3214")
        let negatedValue = -value
        
        XCTAssertEqual(negatedValue, value.decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne), "Incorrect")
    }
    
    func testNegationWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-234.0234")
        let negatedValue = -value
        
        XCTAssertEqual(negatedValue, value.decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne), "Incorrect")
    }
    
    func testNegationWithZero() {
        
        let value = NSDecimalNumber.zero()
        let negatedValue = -value
        
        XCTAssertEqual(negatedValue, value, "Incorrect")
        XCTAssertEqual(negatedValue, value.decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne), "Incorrect")
    }
    
    func testDoubleNegation() {
        
        let value = NSDecimalNumber(string: "-234.0234")
        let negatedValue = -(-value)
        
        XCTAssertEqual(negatedValue, value, "Incorrect")
    }
    
    // MARK: - Overflow
    
    func testOverflow() {
        let leftNumber = NSDecimalNumber.maximumDecimalNumber()
        let rightNumber = NSDecimalNumber.minimumDecimalNumber()
        
        XCTAssertEqual(leftNumber &- rightNumber, NSDecimalNumber.notANumber(), "Should not throw an exception and be NaN")
    }
}
