// MARK: Kata
//
// Usually when you buy something, you're asked whether your credit card number,
// phone number or answer to your most secret question is still correct.
// However, since someone could look over your shoulder,
// you don't want that shown on your screen. Instead, we mask it.
//
// Your task is to write a function maskify, which changes all but the last four characters into '#'.
//
// Examples
//
// "4556364607935616" --> "############5616"
//      "64607935616" -->      "#######5616"
//                "1" -->                "1"
//                 "" -->                 ""
//
// // "What was the name of your first pet?"
//
// "Skippy" --> "##ippy"
//
// "Nananananananananananananananana Batman!"
// -->
// "####################################man!"

// MARK: Solution

/// - My solution
public func maskify(_ string: String) -> String {
    var newStr: String = string
    if string.count > 4 {
        newStr = ""
        let lastFourChar = string.dropFirst(string.count-4)
        for _ in (0...string.count-5) {
            newStr.append(contentsOf: "#")
        }
        newStr = newStr + lastFourChar
    }
    return newStr
}

/// - Clever solution
func maskifyC(_ string: String) -> String {
  string.enumerated().map { $0 < string.count - 4 ? "#" : "\($1)"}.joined()
}

// MARK: Tests

import XCTest

private extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}

public class CreditCardMaskTest: XCTestCase {
    static var allTests = [
        ("testMaskify", testMaskify),
        ("testMaskifyRandomStrings", testMaskifyRandomStrings),
    ]
    
    func testMaskify() {
        XCTAssertEqual(maskify("4556364607935616"), "############5616")
        XCTAssertEqual(maskify("1"), "1")
        XCTAssertEqual(maskify("11111"), "#1111")
    }
    
    func testMaskifyRandomStrings() {
        for _ in 0..<100 {
            let str = randomString(length: .random(in: 0...50))
            let actual = maskify(str)
            let expectedString = str.enumerated().map {
              $0 + 4 >= str.count ? String($1) : "#"
            }.joined()
            XCTAssertEqual(actual, expectedString, "Test failed using \(str). Expected \(expectedString) but got \(actual)")
        }
    }
  
    private func randomString(length: Int) -> String {
      let letters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
      return String((0..<length).compactMap{ _ in letters.randomElement() })
    }
}

