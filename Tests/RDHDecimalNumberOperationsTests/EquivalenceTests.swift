//
//  EquivalenceTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 21/12/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import XCTest

import RDHDecimalNumberOperations

class EquivalenceTests: XCTestCase {

    // MARK: - ==
    
    func testEquality() {
        XCTAssertTrue(NSDecimalNumber.one() == NSDecimalNumber.one(), "Should be equal")
        XCTAssertFalse(NSDecimalNumber.minusOne == NSDecimalNumber.one(), "Should not be equal")
    }
    
    // MARK: - <
    
    func testLessThan() {
        XCTAssertTrue(NSDecimalNumber.minusOne < NSDecimalNumber.one(), "Should be less than")
        XCTAssertFalse(NSDecimalNumber.one() < NSDecimalNumber.one(), "Should not be less than")
        XCTAssertFalse(NSDecimalNumber.one() < NSDecimalNumber.minusOne, "Should not be less than")
    }
    
    // MARK: - Sorting
    
    func testPositiveSorting() {
        let unsortedNumbers: [NSDecimalNumber] = [5, 4, 3, 2, 1, 0]
        let expectedSortedNumbers: [NSDecimalNumber] = [0, 1, 2, 3, 4, 5]
        
        let sortedNumbers = sorted(unsortedNumbers)
        
        XCTAssertEqual(sortedNumbers, expectedSortedNumbers, "Numbers are not correctly sorted")
    }
    
    func testNegativeSorting() {
        let unsortedNumbers: [NSDecimalNumber] = [0, -1, -2, -3, -4, -5]
        let expectedSortedNumbers: [NSDecimalNumber] = [-5, -4, -3, -2, -1, 0]
        
        let sortedNumbers = sorted(unsortedNumbers)
        
        XCTAssertEqual(sortedNumbers, expectedSortedNumbers, "Numbers are not correctly sorted")
    }
    
    func testMixedSorting() {
        let unsortedNumbers: [NSDecimalNumber] = [5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5]
        let expectedSortedNumbers: [NSDecimalNumber] = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5]
        
        let sortedNumbers = sorted(unsortedNumbers)
        
        XCTAssertEqual(sortedNumbers, expectedSortedNumbers, "Numbers are not correctly sorted")
    }
    
    func testDuplicatesSorting() {
        let unsortedNumbers: [NSDecimalNumber] = [0, 5, 4, 3, 2, 1, 5]
        let expectedSortedNumbers: [NSDecimalNumber] = [0, 1, 2, 3, 4, 5, 5]
        
        let sortedNumbers = sorted(unsortedNumbers)
        
        XCTAssertEqual(sortedNumbers, expectedSortedNumbers, "Numbers are not correctly sorted")
    }
}
