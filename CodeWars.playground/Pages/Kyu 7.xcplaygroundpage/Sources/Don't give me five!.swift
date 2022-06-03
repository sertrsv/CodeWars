// MARK: Kata
//
// In this kata you get the start number and the end number of a region
// and should return the count of all numbers except numbers with a 5 in it.
// The start and the end number are both inclusive!
//
// Examples:
//
// 1,9 -> 1,2,3,4,6,7,8,9 -> Result 8
// 4,17 -> 4,6,7,8,9,10,11,12,13,14,16,17 -> Result 12
// The result may contain fives. ;-)
// The start number will always be smaller than the end number. Both numbers can be also negative!
//
// I'm very curious for your solutions and the way you solve it. Maybe someone of you will find an easy pure mathematics solution.
//
// Have fun coding it and please don't forget to vote and rank this kata! :-)
//
// I have also created other katas. Take a look if you enjoyed this kata!

// MARK: Solution

/// My solution
public func dontGiveMeFive(_ start: Int, _ end: Int) -> Int {
    var set: Set<Int> = []
    for num in start...end {
        if !String(num).contains("5") {
            set.insert(num)
        }
    }
    return set.count
}


/// Best practices solution
func dontGiveMeFiveBP(_ start: Int, _ end: Int) -> Int {
    return (start...end).filter { !String($0).contains("5") }.count
}

// MARK: Tests

import XCTest

public class DontGiveMeFiveTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
        ("More Tests", testMore),
        ("Random Tests", testRandom)
    ]
    
    func testExample() {
        XCTAssertEqual(8, dontGiveMeFive(1,9));
        XCTAssertEqual(12, dontGiveMeFive(4,17));
    }
    
    func testMore() {
        XCTAssertEqual(72, dontGiveMeFive(1,90));
        XCTAssertEqual(20, dontGiveMeFive(-4,17));
        XCTAssertEqual(38, dontGiveMeFive(-4,37));
        XCTAssertEqual(13, dontGiveMeFive(-14,-1));
        XCTAssertEqual(9, dontGiveMeFive(-14,-6));
    }
    
    func testRandom() {
        
        func defaultDontGiveMeFive(_ start: Int, _ end: Int) -> Int {
            var result = 0
            
            for i in start...end {
                if !String(i).contains("5") {
                    result += 1
                }
            }
            
            return result
        }
        
        for _ in 0..<30 {
            let start = Int.random(in: -50...50)
            let end = start + Int.random(in: 0...80)
            
            XCTAssertEqual(defaultDontGiveMeFive(start, end), dontGiveMeFive(start,end));
        }
    }
}


