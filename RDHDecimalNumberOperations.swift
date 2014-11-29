//
//  RDHDecimalNumberOperations.swift
//  RDHDecimalNumberOperations
//
//  Created by Richard Hodgkins on 28/11/2014.
//  Copyright (c) 2014 Rich H. All rights reserved.
//

import Foundation

// MARK: - Equivalence

public func == (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.isEqualToNumber(right)
}

public func != (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return !(left == right)
}

public func > (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.compare(right) == NSComparisonResult.OrderedDescending
}

public func >= (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return (left > right) || (left == right)
}

public func < (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return left.compare(right) == NSComparisonResult.OrderedAscending
}

public func <= (left: NSDecimalNumber, right: NSDecimalNumber) -> Bool {
    return (left < right) || (left == right)
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
    return left.decimalNumberByAdding(right, withBehavior: NSDecimalNumberHandler.lenientHandler)
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
    return left.decimalNumberBySubtracting(right, withBehavior: NSDecimalNumberHandler.lenientHandler)
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
    return left.decimalNumberByMultiplyingBy(right, withBehavior: NSDecimalNumberHandler.lenientHandler)
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
    return left.decimalNumberByDividingBy(right, withBehavior: NSDecimalNumberHandler.lenientHandler)
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
    return left.decimalNumberByRaisingToPower(right, withBehavior: NSDecimalNumberHandler.lenientHandler)
}


// MARK: - Other

private extension NSDecimalNumberHandler {
    
    class var lenientHandler: NSDecimalNumberHandler {
        struct Lazily {
            static let handler = NSDecimalNumberHandler(roundingMode: NSDecimalNumberHandler.defaultDecimalNumberHandler().roundingMode(), scale: NSDecimalNumberHandler.defaultDecimalNumberHandler().scale(), raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false);
        }
        return Lazily.handler
    }
}

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

extension NSRoundingMode {
    
    private class Rounding: NSDecimalNumberBehaviors {
        
        let internalRoundingMode: NSRoundingMode
        let internalScale = NSDecimalNumberHandler.defaultDecimalNumberHandler().scale()
        
        init(roundingMode: NSRoundingMode, scale: Int16) {
            internalRoundingMode = roundingMode
            internalScale = scale
        }
        
        func roundingMode() -> NSRoundingMode {
            return internalRoundingMode
        }
        
        func scale() -> Int16 {
            return internalScale
        }
        
        func exceptionDuringOperation(operation: Selector, error: NSCalculationError, leftOperand: NSDecimalNumber, rightOperand: NSDecimalNumber) -> NSDecimalNumber? {
            
            return NSDecimalNumberHandler.defaultDecimalNumberHandler().exceptionDuringOperation(operation, error: error, leftOperand: leftOperand, rightOperand: rightOperand)
        }
    }
 
    func round(value: NSDecimalNumber, scale: Int16) -> NSDecimalNumber {
        
        let roundingBehaviour = Rounding(roundingMode: self, scale: scale)
        return value.decimalNumberByRoundingAccordingToBehavior(roundingBehaviour)
    }
}

// Act like cast operator
infix operator ~ { precedence 132 }

/// @returns the rounded number
func ~ (left: NSDecimalNumber, right: (roundingMode: NSRoundingMode, scale: Int16)) -> NSDecimalNumber {
    return right.roundingMode.round(left, scale: right.scale)
}

/// Rounds the number in place
func ~= (inout left: NSDecimalNumber, right: (roundingMode: NSRoundingMode, scale: Int16)) {
    left = left ~ right
}


// MARK: - Creation

public extension Int {
    
    public var decimalNumber: NSDecimalNumber {
        let mantissa = UInt64(abs(self))
        return NSDecimalNumber(mantissa: mantissa, exponent: 0, isNegative: self < 0)
    }
    
    private func e(exponent: Int16) -> NSDecimalNumber {
        return self.decimalNumber.decimalNumberByMultiplyingByPowerOf10(exponent)
    }
}

public extension UInt {
    
    public var decimalNumber: NSDecimalNumber {
        return NSDecimalNumber(mantissa: UInt64(self), exponent: 0, isNegative: false)
    }
    
    private func e(exponent: Int16) -> NSDecimalNumber {
        return self.decimalNumber.decimalNumberByMultiplyingByPowerOf10(exponent)
    }
}

public extension String {
    
    /// @warning Uses NSDecimalNumber(string:)
    public var decimalNumber: NSDecimalNumber {
        return NSDecimalNumber(string: self)
    }
}
