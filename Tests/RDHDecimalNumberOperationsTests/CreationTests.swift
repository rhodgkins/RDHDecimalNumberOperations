//
//  CreationTests.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 29/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation
import XCTest

import RDHDecimalNumberOperations

class CreationTests: XCTestCase {
    
    // MARK: - Int
    
    func testCreatingFromInt() {
        XCTAssertEqual(1, NSDecimalNumber.one(), "Incorrect")
        XCTAssertEqual((-1), NSDecimalNumber.minusOne, "Incorrect")
        XCTAssertEqual(23432, NSDecimalNumber(string: "23432"), "Incorrect")
        XCTAssertEqual((-8342), NSDecimalNumber(string: "-8342"), "Incorrect")
    }
    
    // MARK: - UInt
    
    func testCreatingFromUInt() {
        XCTAssertEqual(UInt(1), NSDecimalNumber.one(), "Incorrect")
        XCTAssertEqual(UInt(23432), NSDecimalNumber(string: "23432"), "Incorrect")
    }
    
    // MARK: - String
    
    func testCreatingFromString() {
        XCTAssertEqual("32432".decimalNumber, NSDecimalNumber(string: "32432"), "Incorrect")
        XCTAssertEqual("32432e234".decimalNumber, NSDecimalNumber(string: "32432e234"), "Incorrect")
        XCTAssertEqual("hello".decimalNumber, NSDecimalNumber.notANumber(), "Incorrect")
        XCTAssertEqual("hello 20".decimalNumber, NSDecimalNumber.notANumber(), "Incorrect")
    }
}
