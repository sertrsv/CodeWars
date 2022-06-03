

// MARK: Kata
//
// An Arithmetic Progression is defined as one in which there is a constant difference between the consecutive terms of a given series of numbers. You are provided with consecutive elements of an Arithmetic Progression. There is however one hitch: exactly one term from the original series is missing from the set of numbers which have been given to you. The rest of the given series is the same as the original AP. Find the missing term.
//
// You have to write a function that receives a list, list size will always be at least 3 numbers. The missing term will never be the first or last one.
//
// Example
//
// find_missing([1, 3, 5, 9, 11]) == 7
// PS: This is a sample question of the facebook engineer challenge on interviewstreet. I found it quite fun to solve on paper using math, derive the algo that way. Have fun!

// MARK: Solution

/// My solution
public func find_missing(l: [Int]) -> Int {
    let step = (l.last! - l.first!) / l.count
    for index in l.indices {
        if l[index + 1] - l[index] != step {
            return l[index] + step
        }
    }
    return 1
}

/// Clever solution
func find_missingC(l:[Int]) -> Int {
    let sum = l.reduce(0, +)
    return (l[0] + l[l.count-1]) * (l.count + 1) / 2 - sum
}

/// Best practices solution
func find_missingBP(l sequence:[Int]) -> Int {

  let gap = (sequence.last! - sequence.first!) / sequence.count
  
  for i in 0..<sequence.count where (sequence[i] + gap) != sequence[i+1] {
      return sequence[i+1]-gap
  }
  
  return 0
}

// MARK: Tests

import XCTest

public class FindTheMissingTermInAnArithmeticProgressionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
        ("Test Random", testRandom),
    ]
    
    func randomNumber<T : SignedInteger>(inRange range: ClosedRange<T> = 1...6) -> T {
        let length = Int64(range.upperBound - range.lowerBound + 1)
        //let value = Int64(arc4random()) % length + Int64(range.lowerBound)
        let value = Int64(Int.random(in: 0..<Int(length))) + Int64(range.lowerBound)
        return T(value)
    }
    
    func fixture(bound:Int, steps:Int) {
        
        let choice = [-1, 1]
        //let randomChoice = Int(arc4random_uniform(UInt32(choice.count)))
        let randomChoice = Int.random(in: 0..<choice.count)
        let start = randomNumber(inRange: -bound...bound)
        let step = randomNumber(inRange: 3...bound+3) * choice[randomChoice]
        var goodSequence = [Int]()
        var index:Int
        var expected:Int
        var badSequence = [Int]()
        var actual:Int
        // generate sequence
        for i in 0...steps-1 {
            goodSequence.append(start + i * step)
        }
        
        index = randomNumber(inRange: 1...goodSequence.count-2)
        expected = goodSequence[index]
        badSequence = goodSequence
        badSequence.remove(at: index)
        actual = find_missing(l: badSequence)
        XCTAssertEqual(actual, expected)
    }

    func testExample() {
        XCTAssertEqual(find_missing(l: [1, 2, 3, 4, 6, 7, 8, 9]), 5)
        XCTAssertEqual(find_missing(l: [-1, -7, -10, -13, -16, -19, -22, -25, -28]), -4)
        XCTAssertEqual(find_missing(l: [-1, 2, 5, 8, 11, 14, 17, 20, 26]), 23)
        XCTAssertEqual(find_missing(l: [1, -2, -5, -8, -14, -17, -20, -23, -26]), -11)
        XCTAssertEqual(find_missing(l: [12, 4, -4, -12, -20, -28, -44, -52, -60]), -36)
        XCTAssertEqual(find_missing(l: [-13, 5, 14, 23, 32, 41, 50, 59, 68]), -4)
    }
    
    func testRandom() {
        var base = 0
        for i in 1...10 {
            base = 1 + i * 5
            fixture(bound: base, steps: 10)
            fixture(bound: base, steps: 100)
            fixture(bound: base, steps: 1000)
            fixture(bound: base, steps: 10000)
            fixture(bound: base, steps: 100000)
        }
    }
}
