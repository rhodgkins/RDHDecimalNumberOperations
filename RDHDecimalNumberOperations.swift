//
//  RDHDecimalNumberOperations.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 28/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation

// MARK: - Equivalence

extension NSDecimalNumber: Comparable {
}

public func == (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.isEqualToNumber(right)
}

public func < (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.compare(right) == NSComparisonResult.OrderedAscending
}


// MARK: - Addition

public prefix func + (value: NSDecimalNumber) -> NSDecimalNumber {
    return value
}

public func + (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByAdding(right)
}

public func += (inout left: NSDecimalNumber, right: NSDecimalNumber) {
    left = left + right
}

public prefix func ++ (inout value: NSDecimalNumber) -> NSDecimalNumber {
    value += NSDecimalNumber.one()
    return value
}

public postfix func ++ (inout value: NSDecimalNumber) -> NSDecimalNumber {
    let result = value
    ++value
    return result
}

// MARK: Overflow

public func &+ (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByAdding(right, withBehavior: LenientDecimalNumberHandler)
}


// MARK: - Subtraction

public prefix func - (value: NSDecimalNumber) -> NSDecimalNumber {
    return value * NSDecimalNumber.minusOne
}

public func - (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberBySubtracting(right)
}

public func -= (inout left: NSDecimalNumber, right: NSDecimalNumber) {
    left = left - right
}

public prefix func -- (inout value: NSDecimalNumber) -> NSDecimalNumber {
    value -= NSDecimalNumber.one()
    return value
}

public postfix func -- (inout value: NSDecimalNumber) -> NSDecimalNumber {
    let result = value
    --value
    return result
}

// MARK: Overflow

public func &- (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberBySubtracting(right, withBehavior: LenientDecimalNumberHandler)
}


// MARK: - Multiplication

public func * (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByMultiplyingBy(right)
}

public func *= (inout left: NSDecimalNumber, right: NSDecimalNumber) {
    left = left * right
}

// MARK: Overflow

public func &* (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByMultiplyingBy(right, withBehavior: LenientDecimalNumberHandler)
}


// MARK: - Division

public func / (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByDividingBy(right)
}

public func /= (inout left: NSDecimalNumber, right: NSDecimalNumber) {
    left = left / right
}

// MARK: Overflow

public func &/ (left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByDividingBy(right, withBehavior: LenientDecimalNumberHandler)
}


// MARK: - Powers

/// Give greater precedence than multiplication
infix operator ** { precedence 155 }

/// Power
public func ** (left: NSDecimalNumber, right: Int) -> NSDecimalNumber {
    return left.decimalNumberByRaisingToPower(right)
}

/// Match all assignment operators
infix operator **= { associativity right precedence 90 }

/// 2 **= 2 will return 4
public func **= (inout left: NSDecimalNumber, right: Int) {
    left = left ** right
}

// MARK: Overflow

// Match the power operator
infix operator &** { precedence 155 }

public func &** (left: NSDecimalNumber, right: Int) -> NSDecimalNumber {
    return left.decimalNumberByRaisingToPower(right, withBehavior: LenientDecimalNumberHandler)
}


// MARK: - Other

private let LenientDecimalNumberHandler: NSDecimalNumberBehaviors = NSDecimalNumberHandler(roundingMode: NSDecimalNumberHandler.defaultDecimalNumberHandler().roundingMode(), scale: NSDecimalNumberHandler.defaultDecimalNumberHandler().scale(), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)

public extension NSDecimalNumber {
    
    /// -1
    public class var minusOne: NSDecimalNumber {
        struct Lazily {
            static let minusOne = NSDecimalNumber.zero() - NSDecimalNumber.one()
        }
        return Lazily.minusOne
    }
    
    public func isNaN() -> Bool {
        return self == NSDecimalNumber.notANumber()
    }
    
    public func abs() -> NSDecimalNumber {
        
        if (self.isNaN()) {
            return NSDecimalNumber.notANumber()
        }
        
        if (self >= NSDecimalNumber.zero()) {
            return self
        } else {
            return -self
        }
    }
    
    /// @returns the square root of the decimal number, or nil if value was negative
    private func sqrt() -> NSDecimalNumber? {
        
        if (self.isNaN()) {
            return NSDecimalNumber.notANumber()
        }
        
        if (self < NSDecimalNumber.zero()) {
            return nil
        }
        
        // Quickly handle special cases
        
        if (self == NSDecimalNumber.zero()) {
            return NSDecimalNumber.zero()
        }
        
        if (self == NSDecimalNumber.one()) {
            return NSDecimalNumber.one()
        }
        
        struct Lazily {
            static let half = NSDecimalNumber(mantissa: 2, exponent: -1, isNegative: false)
        }
        
        var guess = (self + NSDecimalNumber.one()) * Lazily.half
        
        for _ in 1...6 {
            // Use overflow division
            guess = ((self &/ guess) + guess) * Lazily.half
        }
        
        return guess
    }
}

// MARK: - Rounding

private let VaraibleDecimalNumberHandler: (roundingMode: NSRoundingMode, scale: Int16) -> NSDecimalNumberBehaviors = { (roundingMode, scale) -> NSDecimalNumberHandler in
    
    return NSDecimalNumberHandler(roundingMode: roundingMode, scale: scale, raiseOnExactness: false, raiseOnOverflow: true, raiseOnUnderflow: true, raiseOnDivideByZero: true)
}

public extension NSRoundingMode {
 
    public func round(value: NSDecimalNumber, scale: Int16) -> NSDecimalNumber {
        return value.decimalNumberByRoundingAccordingToBehavior(VaraibleDecimalNumberHandler(roundingMode: self, scale: scale))
    }
}

// Act like cast operator
infix operator ~ { precedence 132 }

/// @returns the rounded number
public func ~ (left: NSDecimalNumber, right: (roundingMode: NSRoundingMode, scale: Int16)) -> NSDecimalNumber {
    return right.roundingMode.round(left, scale: right.scale)
}

/// Rounds the number in place
public func ~= (inout left: NSDecimalNumber, right: (roundingMode: NSRoundingMode, scale: Int16)) {
    left = left ~ right
}


// MARK: - Creation

public extension String {
    
    /// @warning Uses NSDecimalNumber(string:)
    public var decimalNumber: NSDecimalNumber {
        return NSDecimalNumber(string: self)
    }
}
