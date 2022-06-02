// MARK: Kata
//
// You get an array of numbers, return the sum of all of the positives ones.
//
// Example [1,-4,7,12] => 1 + 7 + 12 = 20
//
// Note: if there is nothing to sum, the sum is default to 0.

// MARK: Solution

public func sumOfPositives (_ numbers: [Int] ) -> Int {
    var positiveNumbers: [Int] = []
    for i in numbers {
        i > 0 ? positiveNumbers.append(i) : nil
    }
    return positiveNumbers.reduce(0, +)
}

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
        ("Works for random arrays", randomTests)
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
    
    func randomTests() {
        
        func sumOfPositivesSolution (_ numbers: [Int] ) -> Int {
            
            var total = 0
            for n in numbers {
                if n > 0 {
                    total += n
                }
            }
            return total
        }
        
        let randomSize = { return Int(arc4random() % 20) }
        
        func makeList(_ n: Int) -> [Int] {
            return (0..<n).map{ _ in Int(arc4random() % 40 - 20) }
        }
        
        for _ in 1...100 {
            let n = randomSize();
            let list = makeList(n);
            let expected = sumOfPositivesSolution(list)
            let actual = sumOfPositives(list)
            XCTAssertEqual(actual, expected, "It should work for \(list)")
        }
    }
}
