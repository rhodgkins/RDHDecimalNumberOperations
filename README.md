RDHDecimalNumberOperations [![Build Status](https://travis-ci.org/rhodgkins/RDHDecimalNumberOperations.svg)](https://travis-ci.org/rhodgkins/RDHDecimalNumberOperations)
==========================

* **Complete test suite**
* All basic operators supported
* Comparison operators
* [**Overflow operators**](#overflow)
* [Creation](#convenience) from `Int` and `String`
* `abs()`, `isNaN()` methods added for convenience
* `minusOne` class `var` added for convenience

Coming soon:
* Rounding operator (present but currently not tested)

Installation
-------
Swift extension for NSDecimalNumber operations.
Until Cocoapods properly support Swift, just drop [`RDHDecimalNumberOperations.swift`](https://github.com/rhodgkins/RDHDecimalNumberOperations/blob/master/RDHDecimalNumberOperations.swift) into your project.

Operators
---------

All the standard operators are supported (see [Overflow](#overflow) for the new Swift operators):
* `+`
* `-`
* `*`
* `/`
* `+=`
* `-=`
* `*=`
* `/=`
* `++` (as both prefix and suffix)
* `--` (as both prefix and suffix)
* `==`
* `!=`
* `>`
* `>=`
* `<`
* `<=`

Also the raise to power operator
* `**` - raise a `NSDecimalNumber` to an `Int` power
* `**=` - raise the `NSDecimalNumber` to an `Int` power in place

The unary versions of both `+` and `-` work correctly:
```swift
let two = NSDecimalNumber(string: "2")
let minusTwo = -two
```

Overflow
--------
Introduced in Swift were also [overflow operators](https://developer.apple.com/library/mac/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-XID_73), and these are also supported to prevent any exceptions being thrown with overflow, underflow, loss of precision and the more common dividing by zero.
* `&+`
* `&-`
* `&*`
* `&/`
* `&**` (with an `Int` power)

This means the following will *not* throw an exception, instead returning `NSDecimalNumber.notANumber()`:
```swift
let notANumber = NSDecimalNumber.one() / NSDecimalNumber.zero()
```

Convenience
---------
As well as operator support, convenience methods for obtaining `NSDecimalNumber`s have been added to `Int`, `UInt` and `String`.
```swift
let numberFromInt = 1.decimalValue
let numberFromString = "1".decimalValue
```

Rounding
--------

*Note that tests are currenlty (as of 29-Nov-2014) being written for this functionality. As such it is currently marked as private in the API.*

A rounding method has been added to the `NSRoundingMode` enum:
```swift
let twoThirds = NSDecimalNumber(string: "2") / NSDecimalNumber(string: "3")
let roundedNumber = NSRoundingMode.RoundUp.round(twoThirds, scale: 0)
println("\(twoThirds) rounded up to \(roundedNumber)")
```
Output:
```
0.6667 rounded up to 1
```
