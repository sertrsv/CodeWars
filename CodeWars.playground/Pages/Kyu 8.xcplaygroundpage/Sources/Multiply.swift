// MARK: Kata
//
// This code does not execute properly. Try to figure out why.

// MARK: Solution

/// My solution
public func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

/// Clever solution
let multiplyC: (Double, Double) -> Double = { $0 * $1 }

// MARK: Tests

import XCTest

public class MultiplyTest: XCTestCase {
    static var allTests = [
        ("testMultiplyInts", testMultiplyInts),
        ("testMultiplyDoubles", testMultiplyDoubles),
    ]
    
    func testMultiplyInts() {
        XCTAssertEqual(multiply(1, 3), 3, accuracy:0.0000001)
        XCTAssertEqual(multiply(0, 3), 0, accuracy:0.0000001)
        XCTAssertEqual(multiply(-1, 3), -3, accuracy:0.0000001)
    }
    
    func testMultiplyDoubles() {
        XCTAssertEqual(multiply(1.1, 3), 3.3, accuracy:0.0000001)
        XCTAssertEqual(multiply(0, 3), 0, accuracy:0.0000001)
        XCTAssertEqual(multiply(-1.5, 3), -4.5, accuracy:0.000001)
    }
}
