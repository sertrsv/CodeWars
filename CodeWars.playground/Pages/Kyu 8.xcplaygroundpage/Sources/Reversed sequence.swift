// MARK: Kata
//
// Build a function that returns an array of integers from n to 1 where n>0.
//
// Example : n=5 --> [5,4,3,2,1]

// MARK: Solution

public func reverseSeq(n: Int) -> [Int] {
    var arr: [Int] = []
    for i in 0..<n {
        arr.append(n-i)
    }
    return arr
}

func reverseSeqBP(n: Int) -> [Int] {
    return (1...n).reversed()
}

// MARK: Tests

import XCTest

public class ReversedSequenceTest: XCTestCase {
    
    static var allTests = [
        ("Test n 5", testN5),
        ("Test n 100", testN100),
        ("Random input test", testRandom)
    ]
    
    func testN5() {
        let expectedResult = solution(n: 5)
        XCTAssertEqual(expectedResult, reverseSeq(n: 5))
    }
    
    func testN100() {
        let expectedResult = solution(n: 100)
        XCTAssertEqual(expectedResult, reverseSeq(n: 100))
    }
    
    func testRandom() {
        let randomInput = generateRandomInput()
        let expectedResult = solution(n: randomInput)
        XCTAssertEqual(reverseSeq(n: randomInput), expectedResult)
    }
    
    private func solution(n: Int) -> [Int] {
        return (1...n).map { $0 }.reversed()
    }

    private func generateRandomInput() -> Int {
        return (10...1000).randomElement()!
    }

}
