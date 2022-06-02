// MARK: Kata
//
// write me a function stringy that takes a size and returns a string of alternating '1s' and '0s'.
//
// the string should start with a 1.
//
// a string with size 6 should return :'101010'.
//
// with size 4 should return : '1010'.
//
// with size 12 should return : '101010101010'.
//
// The size will always be positive and will only use whole numbers.

// MARK: Solution

public func stringy(_ size: Int) -> String {
    var str = ""
    for i in 1...size {
        (i % 2 == 0) ? (str += "0") : (str += "1")
    }
    return str
}

func stringyC(_ size: Int) -> String {
    return (0..<size).map { $0 % 2 == 0 ? "1" : "0" }.joined()
}

// MARK: Tests

import XCTest

public class StringyStringsTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
        ("Test Odd", testOdd),
        ("Test Even", testEven),
        ("Test Random", testRandom),
    ]
    
    func testExample() {
        XCTAssertEqual(stringy(1), "1")
        XCTAssertEqual(stringy(2), "10")
        XCTAssertEqual(stringy(3), "101")
    }
    
    func testOdd() {
        XCTAssertEqual(stringy(3), "101")
        XCTAssertEqual(stringy(5), "10101")
        XCTAssertEqual(stringy(11), "10101010101")
    }
    
    func testEven() {
        XCTAssertEqual(stringy(2), "10")
        XCTAssertEqual(stringy(4), "1010")
        XCTAssertEqual(stringy(16), "1010101010101010")
    }
    
    func testRandom() {
        (0..<250).forEach { _ in
            let value = max(arc4random() % 100, 1)
            XCTAssertEqual(stringy(Int(value)), testStringy(Int(value)))
        }
    }
    
    private func testStringy(_ size: Int) -> String {
        return (0..<size).map { $0 % 2 == 0 ? "1" : "0" }.joined()
    }
}
