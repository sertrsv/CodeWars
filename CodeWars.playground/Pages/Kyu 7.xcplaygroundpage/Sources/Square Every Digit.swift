// MARK: Kata
//
// Welcome. In this kata, you are asked to square every digit of a number and concatenate them.
//
// For example, if we run 9119 through the function, 811181 will come out, because 92 is 81 and 12 is 1.
//
// Note: The function accepts an integer and returns an integer

// MARK: Solution

/// My solution
public func squareDigits(_ num: Int) -> Int {
    var retStr = ""
    for i in String(num) {
        let digit = Int(i.wholeNumberValue!)
        retStr.append(String(digit * digit))
    }
    return Int(retStr)!
}


/// Clever solution
func squareDigitsC(_ num: Int) -> Int {
    Int(String(num).compactMap() {
        String(Int(pow(Double(String($0))!, 2)))
    }.joined())!
}

// MARK: Tests

import XCTest

public class SquareEveryDigitTest: XCTestCase {
    static var allTests = [
        ("Premade tests", testPremade),
        ("Random tests", testRandom),
    ]
    
    func testPremade() {
        XCTAssertEqual(squareDigits(3212), 9414, "Invalid answer for 3212")
        XCTAssertEqual(squareDigits(2112), 4114, "Invalid answer for 2112")
        XCTAssertEqual(squareDigits(0), 0, "Invalid answer for 2112")
    }
    
    func testRandom() {
        for _ in 1..<101 {
            randomTest()
        }
    }
    
    private func randomTest() {
        let numbers = "123456789".map { String($0) }
        let randomtest = Int(
            numbers.randomElement()! +
            numbers.randomElement()! +
            numbers.randomElement()! +
            numbers.randomElement()!
        )!
        XCTAssertEqual(squareDigits(randomtest), squareDigitsTest(randomtest), "Invalid answer for \(randomtest)")
    }
    
    private func squareDigitsTest(_ num: Int) -> Int {
        let digits = String(num).compactMap { Int(String($0)) }
        let squared = digits.map { $0 * $0 }
        let joinedString = squared.map { String($0) }.joined(separator: "")
        return Int(joinedString)!
    }
}





