// MARK: Kata
//
// Triangular numbers are so called because of the equilateral triangular shape that they occupy when laid out as dots. i.e.
//
// 1st (1)   2nd (3)    3rd (6)
// *          **        ***
//            *         **
//                      *
// You need to return the nth triangular number. You should return 0 for out of range values:
//
// For example: (Input --> Output)
//
// 0 --> 0
// 2 --> 3
// 3 --> 6
// -10 --> 0

// MARK: Solution

/// My solution
public func triangular(_ n: Int) -> Int{
    if n > 0 {
        var c = 0
        for i in (1..<n) {
            c += i
        }
        return n * n - c
    } else {
        return 0
    }
}


/// Clever solution
func triangularC(_ n: Int) -> Int{
    return n > 0 ? (1...n).reduce(0,+) : 0
}

/// Best practices solution
func triangularBP(_ n: Int) -> Int{
    guard n > 0 else { return 0 }
    return n * (1 + n) / 2
}

// MARK: Tests

import XCTest

public class TriangularTreasureTest: XCTestCase {
    
    static var allTests = [
        ("n == 1",     test_nEquals1),
        ("n == 2",     test_nEquals2),
        ("n == 7",     test_nEquals7),
        ("n == 12",    test_nEquals12),
        ("n == 25",    test_nEquals25),
        ("n == 50",    test_nEquals50),
        ("n == 1000",  test_nEquals1000),
    //    ("n == 5000",  test_nEquals5000),
        ("n == 10000", test_nEquals10000),
        ("n == 0",     test_nEquals0),
        ("n == -1",    test_nEqualsNegative1),
        ("n == -5",    test_nEqualsNegative5)
    ]

        func test_nEquals1() {
            XCTAssertEqual( triangular(1), 1 )
        }
        func test_nEquals2() {
            XCTAssertEqual( triangular(2), 3 )
        }
        func test_nEquals7() {
            XCTAssertEqual( triangular(7), 28 )
        }
        func test_nEquals12() {
            XCTAssertEqual( triangular(12), 78 )
        }
        func test_nEquals25() {
            XCTAssertEqual( triangular(25), 325 )
        }
        func test_nEquals50() {
            XCTAssertEqual( triangular(50), 1275 )
        }
        func test_nEquals1000() {
            XCTAssertEqual( triangular(1000), 500500 )
        }
        func test_nEquals5000() {
            XCTAssertEqual( triangular(5000), 12502500 )
        }
        func test_nEquals10000() {
            XCTAssertEqual( triangular(10000), 50005000 )
        }
        func test_nEquals0() {
            XCTAssertEqual( triangular(0), 0 )
        }
        func test_nEqualsNegative1() {
            XCTAssertEqual( triangular(-1), 0 )
        }
        func test_nEqualsNegative5() {
            XCTAssertEqual( triangular(-5), 0 )
        }
    }
