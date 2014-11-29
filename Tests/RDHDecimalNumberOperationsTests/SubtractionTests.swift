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
    
    func testSubtractingPositiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() - NSDecimalNumber.one(), NSDecimalNumber.one().decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "4")
        let rightPositiveNumber = NSDecimalNumber(string: "6.5")
        
        XCTAssertEqual(leftPositiveNumber - rightPositiveNumber, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber - leftPositiveNumber, rightPositiveNumber.decimalNumberBySubtracting(leftPositiveNumber), "Incorrect")
        
        XCTAssertEqual(leftPositiveNumber - NSDecimalNumber.zero(), leftPositiveNumber, "Should not change")
        
        XCTAssertEqual(NSDecimalNumber.zero() - NSDecimalNumber.zero(), NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testSubtractingNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne() - NSDecimalNumber.minusOne(), NSDecimalNumber.minusOne().decimalNumberBySubtracting(NSDecimalNumber.minusOne()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "-8")
        let rightPositiveNumber = NSDecimalNumber(string: "-7.9")
        
        XCTAssertEqual(leftPositiveNumber - rightPositiveNumber, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber - leftPositiveNumber, rightPositiveNumber.decimalNumberBySubtracting(leftPositiveNumber), "Incorrect")
        
        XCTAssertEqual(leftPositiveNumber - NSDecimalNumber.zero(), leftPositiveNumber, "Should not change")
    }
    
    func testSubtractingPostiveToNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() - NSDecimalNumber.minusOne(), NSDecimalNumber.one().decimalNumberBySubtracting(NSDecimalNumber.minusOne()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "12")
        let rightPositiveNumber = NSDecimalNumber(string: "-90.1")
        
        XCTAssertEqual(leftPositiveNumber - rightPositiveNumber, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber - leftPositiveNumber, rightPositiveNumber.decimalNumberBySubtracting(leftPositiveNumber), "Incorrect")
    }
    
    func testSubtractingNegativeToPostiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne() - NSDecimalNumber.one(), NSDecimalNumber.minusOne().decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "-12122.32")
        let rightPositiveNumber = NSDecimalNumber(string: "23")
        
        XCTAssertEqual(leftPositiveNumber - rightPositiveNumber, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber - leftPositiveNumber, rightPositiveNumber.decimalNumberBySubtracting(leftPositiveNumber), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignedSubtractionPositiveNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "4")
        let rightPositiveNumber = NSDecimalNumber(string: "6.5")
        
        var result = leftPositiveNumber
        
        result -= rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignedSubtractionNegativeNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "-8")
        let rightPositiveNumber = NSDecimalNumber(string: "-7.9")
        
        var result = leftPositiveNumber
        
        result -= rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignedSubtractionPostiveToNegativeNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "12")
        let rightPositiveNumber = NSDecimalNumber(string: "-90.1")
        
        var result = leftPositiveNumber
        
        result -= rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignedSubtractionNegativeToPostiveNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "-12122.32")
        let rightPositiveNumber = NSDecimalNumber(string: "23")
        
        var result = leftPositiveNumber
        
        result -= rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberBySubtracting(rightPositiveNumber), "Incorrect")
        
        result -= NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    // MARK: - Prefix
    
    func testPrefixDecrementWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "34")
        var incrementing = value
        var result = --incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    func testPrefixDecrementWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-383")
        var incrementing = value
        var result = --incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    // MARK: - Suffix
    
    func testSuffixDecrementWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "234")
        var incrementing = value
        var result = incrementing--
        
        XCTAssertEqual(incrementing, value.decimalNumberBySubtracting(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value, "Incorrect")
        XCTAssertNotEqual(result, incrementing, "Incorrect")
        XCTAssertEqual(result.decimalNumberBySubtracting(NSDecimalNumber.one()), incrementing, "Incorrect")
    }
    
    func testSuffixDecrementWithNegativeNumbers() {
        
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
        
        XCTAssertEqual(negatedValue, value.decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne()), "Incorrect")
    }
    
    func testNegationWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-234.0234")
        let negatedValue = -value
        
        XCTAssertEqual(negatedValue, value.decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne()), "Incorrect")
    }
    
    func testNegationWithZero() {
        
        let value = NSDecimalNumber.zero()
        let negatedValue = -value
        
        XCTAssertEqual(negatedValue, value, "Incorrect")
        XCTAssertEqual(negatedValue, value.decimalNumberByMultiplyingBy(NSDecimalNumber.minusOne()), "Incorrect")
    }
}
