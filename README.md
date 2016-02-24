RDHDecimalNumberOperations 
==========================
[![Build Status](https://travis-ci.org/rhodgkins/RDHDecimalNumberOperations.svg?branch=master)](https://travis-ci.org/rhodgkins/RDHDecimalNumberOperations)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Pod Version](http://img.shields.io/cocoapods/v/RDHDecimalNumberOperations.svg)](http://cocoadocs.org/docsets/RDHDecimalNumberOperations/)
[![Pod Platform](http://img.shields.io/cocoapods/p/RDHDecimalNumberOperations.svg)](http://cocoadocs.org/docsets/RDHDecimalNumberOperations/)
[![Pod License](http://img.shields.io/cocoapods/l/RDHDecimalNumberOperations.svg)](http://opensource.org/licenses/MIT)

* **Complete test suite**
* All basic operators supported
* Comparison operators
* [**Overflow operators**](#overflow)
* [Creation](#convenience) from `String`
* `abs()`, `isNaN()` methods added for convenience
* `minusOne` class `var` added for convenience
* [Rounding](#rounding) operator

Installation
-------

With Carthage:

```ogdl
github "rhodgkins/RDHDecimalNumberOperations" ~> 2.0
```

With CocoaPods:
```ruby
pod 'RDHDecimalNumberOperations', '~> 2.0.0'
```

Or, just drop [`RDHDecimalNumberOperations.swift`](https://github.com/rhodgkins/RDHDecimalNumberOperations/blob/master/RDHDecimalNumberOperations.swift) into your project.

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
As well as operator support, a convenience method for obtaining `NSDecimalNumber`s from `String`s has been added.
```swift
let numberFromString = "1".decimalValue
```

And don't forget you can already utilise `IntegerLiteralConvertible` (inherited from `NSNumber`):
```swift
let numberFromInt: NSDecimalNumber = 10
```

Rounding
--------

A rounding method has been added to the `NSRoundingMode` enum:
```swift
let twoThirds = NSDecimalNumber(string: "2") / NSDecimalNumber(string: "3")
let roundedNumber = NSRoundingMode.RoundUp.round(twoThirds, scale: 0)
println("\(twoThirds) rounded up to \(roundedNumber)")
```
Also for even quicker and easier rounding an operator has been added `~`:
```swift
let twoThirds = NSDecimalNumber(string: "2") / NSDecimalNumber(string: "3")
let roundedNumber = twoThirds ~ (roundingMode: NSRoundingMode.RoundUp, scale: 0)
println("\(twoThirds) rounded up to \(roundedNumber)")
```
And for in place rounding:
```swift
let twoThirds = NSDecimalNumber(string: "2") / NSDecimalNumber(string: "3")
var roundedNumber = twoThirds
roundedNumber ~= (NSRoundingMode.RoundUp, 0)
println("\(twoThirds) rounded up to \(roundedNumber)")
```

Output:
```
0.6666 rounded up to 1
```
