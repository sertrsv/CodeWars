// MARK: Kata
//
// You get an array of numbers, return the sum of all of the positives ones.
//
// Example [1,-4,7,12] => 1 + 7 + 12 = 20
//
// Note: if there is nothing to sum, the sum is default to 0.

// MARK: Solution

/// My solution
public func sumOfPositives(_ numbers: [Int] ) -> Int {
    var positiveNumbers: [Int] = []
    for i in numbers {
        i > 0 ? positiveNumbers.append(i) : nil
    }
    return positiveNumbers.reduce(0, +)
}

/// Best practices solution
func sumOfPositivesBP(_ numbers: [Int] ) -> Int {
    return numbers.filter{ $0 > 0 }.reduce(0, +)
}

// MARK: Tests

import XCTest

public class SumOfPositiveTest: XCTestCase {
    static var allTests = [
        ("Works for some examples", testExample),
        ("Returns 0 when array is empty", testEmptyArray),
        ("Returns 0 when all elements are negative", testAllNegatives),
        ("Works for random arrays", testRandom)
    ]
    
    func testExample() {
        XCTAssertEqual(sumOfPositives([1,2,3,4,5]), 15)
        XCTAssertEqual(sumOfPositives([1,-2,3,4,5]), 13)
        XCTAssertEqual(sumOfPositives([-1,2,3,4,-5]), 9)
    }
    
    func testEmptyArray() {
        XCTAssertEqual(sumOfPositives([]), 0);
    }
    
    func testAllNegatives() {
        XCTAssertEqual(sumOfPositives([-1,-2,-3,-4,-5]), 0);
    }
    
    func testRandom() {
        
        func sumOfPositivesSolution (_ numbers: [Int] ) -> Int {
            
            var total = 0
            for n in numbers {
                if n > 0 {
                    total += n
                }
            }
            return total
        }
        
        func makeList(_ n: Int) -> [Int] {
            return (0..<n).map{ _ in Int.random(in: -20...20) }
        }
        
        for _ in 1...100 {
            let n = Int.random(in: 0...20)
            let list = makeList(n)
            let expected = sumOfPositivesSolution(list)
            let actual = sumOfPositives(list)
            XCTAssertEqual(actual, expected, "It should work for \(list)")
        }
    }
}
