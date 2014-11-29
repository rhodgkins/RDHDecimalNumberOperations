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
    
    func testAddingPositiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() + NSDecimalNumber.one(), NSDecimalNumber.one().decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "4")
        let rightPositiveNumber = NSDecimalNumber(string: "6.5")
        
        XCTAssertEqual(leftPositiveNumber + rightPositiveNumber, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber + leftPositiveNumber, rightPositiveNumber.decimalNumberByAdding(leftPositiveNumber), "Incorrect")
        
        XCTAssertEqual(leftPositiveNumber + NSDecimalNumber.zero(), leftPositiveNumber, "Should not change")
        
        XCTAssertEqual(NSDecimalNumber.zero() + NSDecimalNumber.zero(), NSDecimalNumber.zero(), "Should be zero")
    }
    
    func testAddingNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne() + NSDecimalNumber.minusOne(), NSDecimalNumber.minusOne().decimalNumberByAdding(NSDecimalNumber.minusOne()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "-8")
        let rightPositiveNumber = NSDecimalNumber(string: "-7.9")
        
        XCTAssertEqual(leftPositiveNumber + rightPositiveNumber, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber + leftPositiveNumber, rightPositiveNumber.decimalNumberByAdding(leftPositiveNumber), "Incorrect")
        
        XCTAssertEqual(leftPositiveNumber + NSDecimalNumber.zero(), leftPositiveNumber, "Should not change")
    }
    
    func testAddingPostiveToNegativeNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.one() + NSDecimalNumber.minusOne(), NSDecimalNumber.one().decimalNumberByAdding(NSDecimalNumber.minusOne()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "12")
        let rightPositiveNumber = NSDecimalNumber(string: "-90.1")
        
        XCTAssertEqual(leftPositiveNumber + rightPositiveNumber, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber + leftPositiveNumber, rightPositiveNumber.decimalNumberByAdding(leftPositiveNumber), "Incorrect")
    }
    
    func testAddingNegativeToPostiveNumbers() {
        
        XCTAssertEqual(NSDecimalNumber.minusOne() + NSDecimalNumber.one(), NSDecimalNumber.minusOne().decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        
        let leftPositiveNumber = NSDecimalNumber(string: "-12122.32")
        let rightPositiveNumber = NSDecimalNumber(string: "23")
        
        XCTAssertEqual(leftPositiveNumber + rightPositiveNumber, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        // Associativity
        XCTAssertEqual(rightPositiveNumber + leftPositiveNumber, rightPositiveNumber.decimalNumberByAdding(leftPositiveNumber), "Incorrect")
    }
    
    // MARK: - Assignment
    
    func testAssignedAdditionPositiveNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "4")
        let rightPositiveNumber = NSDecimalNumber(string: "6.5")
        
        var result = leftPositiveNumber
        
        result += rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignedAdditionNegativeNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "-8")
        let rightPositiveNumber = NSDecimalNumber(string: "-7.9")
        
        var result = leftPositiveNumber
        
        result += rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignedAdditionPostiveToNegativeNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "12")
        let rightPositiveNumber = NSDecimalNumber(string: "-90.1")
        
        var result = leftPositiveNumber
        
        result += rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    func testAssignedAdditionNegativeToPostiveNumbers() {
        
        let leftPositiveNumber = NSDecimalNumber(string: "-12122.32")
        let rightPositiveNumber = NSDecimalNumber(string: "23")
        
        var result = leftPositiveNumber
        
        result += rightPositiveNumber
        XCTAssertEqual(result, leftPositiveNumber.decimalNumberByAdding(rightPositiveNumber), "Incorrect")
        
        result += NSDecimalNumber.zero()
        XCTAssertEqual(result, result, "Should not change")
    }
    
    // MARK: - Prefix
    
    func testPrefixIncrementWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "34")
        var incrementing = value
        var result = ++incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    func testPrefixIncrementWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-383")
        var incrementing = value
        var result = ++incrementing
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, incrementing, "Incorrect")
    }
    
    // MARK: - Suffix
    
    func testSuffixIncrementWithPositiveNumbers() {
        
        let value = NSDecimalNumber(string: "234")
        var incrementing = value
        var result = incrementing++
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value, "Incorrect")
        XCTAssertNotEqual(result, incrementing, "Incorrect")
        XCTAssertEqual(result.decimalNumberByAdding(NSDecimalNumber.one()), incrementing, "Incorrect")
    }
    
    func testSuffixIncrementWithNegativeNumbers() {
        
        let value = NSDecimalNumber(string: "-4358")
        var incrementing = value
        var result = incrementing++
        
        XCTAssertEqual(incrementing, value.decimalNumberByAdding(NSDecimalNumber.one()), "Incorrect")
        XCTAssertEqual(result, value, "Incorrect")
        XCTAssertNotEqual(result, incrementing, "Incorrect")
        XCTAssertEqual(result.decimalNumberByAdding(NSDecimalNumber.one()), incrementing, "Incorrect")
    }
}
