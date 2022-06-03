// MARK: Kata
//
// Create a function that returns the sum of the two lowest positive numbers
// given an array of minimum 4 positive integers.
// No floats or non-positive integers will be passed.
//
// For example, when an array is passed like [19, 5, 42, 2, 77], the output should be 7.
//
// [10, 343445353, 3453445, 3453545353453] should return 3453455.

// MARK: Solution

/// My solution
public func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
    var newArray = array
    let minE: Int? = newArray.min()
    if let i = newArray.firstIndex(of: minE!) {
        newArray.remove(at: i)
    }
    let minE2: Int? = newArray.min()
    return minE! + minE2!
}

/// Clever solution
func sumOfTwoSmallestIntegersInC(_ array: [Int]) -> Int {
    return array.sorted()[0...1].reduce(0, +)
}

/// Best practices solution
func sumOfTwoSmallestIntegersInBP(_ array: [Int]) -> Int {
    let sort = array.sorted()
    return sort[0] + sort[1]
}

// MARK: Tests

import XCTest

func solution(_ array: [Int]) -> Int {
    var first = 1000
    var second = 1000
    for num in array {
        if num < second {
            if num < first {
                second = first
                first = num
            } else {
                second = num
            }
        }
    }
    return first + second
}

public class SumOfTwoLowestPositiveIntegersTest: XCTestCase {
    static var allTests = [
        ("testExample", testExample),
        ("testRandom", testRandom)
    ]
    
    func testExample() {
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([5, 8, 12, 18, 22]), 13)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([7, 15, 12, 18, 22]), 19)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([25, 42, 12, 18, 22]), 30)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([1, 8, 12, 18, 5]), 6)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([13, 12, 5, 61, 22]), 17)
    }
    
    func testRandom() {
        for _ in 0..<45 {
            var testArr = [Int]()
            let numberCount = Int(arc4random()) % 30 + 4
            for _ in 0..<numberCount {
                testArr.append(Int(arc4random()) % 1000 + 1)
            }
            let expected = solution(testArr)
            XCTAssertEqual(sumOfTwoSmallestIntegersIn(testArr), expected)
        }
    }
}
