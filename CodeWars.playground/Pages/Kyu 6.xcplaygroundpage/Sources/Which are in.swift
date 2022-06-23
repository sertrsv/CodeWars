// MARK: Kata
//
// Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.
//
// Example 1:
//
// a1 = ["arp", "live", "strong"]
//
// a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
//
// returns ["arp", "live", "strong"]
//
// Example 2:
//
// a1 = ["tarp", "mice", "bull"]
//
// a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
//
// returns []
//
// Notes:
//
// Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
// In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
// Beware: r must be without duplicates.

// MARK: Solution

/// My solution
public func inArray(_ a1: [String], _ a2: [String]) -> [String] {
    var result: Set<String> = []
    for sub in a1 {
        a2.forEach({
            if $0.contains(sub) {
                result.insert(sub)
            }
        })
    }
    return result.sorted(by: <)
}


/// Best practices solution
func inArrayC(_ a1: [String], _ a2: [String]) -> [String] {
    return Set(a1.filter { s1 in a2.contains { $0.contains(s1) } }).sorted()
}

// MARK: Tests

import XCTest

public class WhichAreInTest: XCTestCase {
    static var allTests = [
        ("inArray", testExample),
    ]

    func testing(_ a1: [String], _ a2: [String], _ expected: [String]) {
        XCTAssertTrue(inArray(a1, a2) == expected, "should return \(expected)")
    }

    func testExample() {
        var a1 = ["live", "arp", "strong"]
        var a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
        var r = ["arp", "live", "strong"]
        testing(a1, a2, r)

        a1 = ["arp", "mice", "bull"]
        a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
        r = ["arp"]
        testing(a1, a2, r)
    }
}
