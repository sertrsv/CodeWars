// MARK: Kata
//
// Create a function that takes an integer as an argument and returns "Even" for even numbers or "Odd" for odd numbers.

// MARK: Solution

/// - My solution
public func evenOrOdd(_ number: Int) -> String {
    return (number % 2 == 0) ? "Even" : "Odd"
}

/// - Best practices solution
func evenOrOddBP(_ number: Int) -> String {
    return number % 2 == 0 ? "Even" : "Odd"
}

// MARK: Tests

import XCTest

public class EvenOrOddTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(evenOrOdd(2),"Even")
        XCTAssertEqual(evenOrOdd(1),"Odd")
        XCTAssertEqual(evenOrOdd(-4),"Even")
        XCTAssertEqual(evenOrOdd(-3),"Odd")
        XCTAssertEqual(evenOrOdd(0),"Even")
        
        XCTAssertEqual(evenOrOdd(1545452),"Even")
        XCTAssertEqual(evenOrOdd(7),"Odd")
        XCTAssertEqual(evenOrOdd(78),"Even")
        XCTAssertEqual(evenOrOdd(17),"Odd")
        XCTAssertEqual(evenOrOdd(74156741),"Odd")
        XCTAssertEqual(evenOrOdd(100000),"Even")
        
        let ernd = { return Int(25 + Int.random(in: 0...25)) * 2 }
        let ornd = { return ernd() + 1 }
        
        for _ in 0..<6 {
            if Int.random(in: 0...100) < 50 {
                let x = ernd()
                XCTAssertEqual(evenOrOdd(x), "Even", "evenOrOdd(\(x))")
            } else {
                let x = ornd()
                XCTAssertEqual(evenOrOdd(x), "Odd", "evenOrOdd(\(x))")
            }
        }
    }
}
