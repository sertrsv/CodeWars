// MARK: Kata
//
// A child is playing with a ball on the nth floor of a tall building. The height of this floor, h, is known.
//
// He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).
//
// His mother looks out of a window 1.5 meters from the ground.
//
// How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?
//
// Three conditions must be met for a valid experiment:
//
// Float parameter "h" in meters must be greater than 0
// Float parameter "bounce" must be greater than 0 and less than 1
// Float parameter "window" must be less than h.
// If all three conditions above are fulfilled, return a positive integer, otherwise return -1.
//
// Note:
//
// The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.
//
// Examples:
//
// - h = 3, bounce = 0.66, window = 1.5, result is 3
//
// - h = 3, bounce = 1, window = 1.5, result is -1
//
// (Condition 2) not fulfilled).

// MARK: Solution

/// My solution
public func bouncingBall(_ h: Double, _ bounce: Double, _ window: Double) -> Int {
    if h < 0 || bounce <= 0 || bounce >= 1 || window >= h {
        return -1
    }
    
    var result = 1
    var ball = h * bounce
    while ball > window {
        result += 2
        ball *= bounce
    }
    return result
}

/// Best practices solution
func bouncingBallBP(_ h: Double, _ bounce: Double, _ window: Double) -> Int {
    guard h > 0 && bounce > 0 && bounce < 1 && window < h else { return -1 }
    var views = 1
    var height = h * bounce
    while height > window {
        views += 2
        height *= bounce
    }
    return views
}

// MARK: Tests

import XCTest

public class BouncingBallsTest: XCTestCase {
    static var allTests = [
        ("bouncingBall", testExample),
        ("Random Examples", testRandomExample),
    ]
    
    func testequal(_ h: Double, _ bounce: Double, _ window: Double, _ expected: Int) {
        XCTAssertEqual(bouncingBall(h, bounce, window), expected)
    }
    
    func testExample() {
        testequal(2, 0.5, 1.0, 1)
        testequal(3, 0.66, 1.5, 3)
        testequal(30, 0.66, 1.5, 15)
        testequal(30, 0.75, 1.5, 21)
        testequal(30, 0.4, 10, 3)
        testequal(40, 0.4, 10, 3)
        testequal(10, 0.6, 10, -1)
        testequal(40, 1, 10, -1)
        testequal(-5, 0.66, 1.5, -1)
        testequal(5, -1, 1.5, -1)
        
        testequal(3.0, 0.66, 1.5, 3)
        testequal(30.0, 0.66, 1.5, 15)
        testequal(30.0, 0.75, 1.5, 21)
        testequal(30.0, 0.4, 10.0, 3)
        testequal(40.0, 0.4, 10.0, 3)
        testequal(10.0, 0.6, 10.0, -1)
        testequal(40.0, 1.0, 10.0, -1)
        
        testequal(10.5, 0.6, 1.5, 7)
        testequal(46.0, 0.75, 46.00, -1)
        testequal(10.5, 0.6, 1.5, 7)
        testequal(109.5, 0.75, 1.09, 33)
        testequal(12.2, 12.2, 12.2, -1)
        testequal(5.0, 0.83, 5.0, -1)
        testequal(109.0, 0.75, 1.09, 33)
        testequal(3.0, 0.75, 3.0, -1)
        testequal(2.99, 0.75, 3.0, -1)
        testequal(25.8, 0.6, 2.8, 9)
        testequal(57.0, 0.9, 0.57, 87)
        testequal(15.25, 0.6, 1.0, 11)
        testequal(109.0, 0.75, 1.09, 33)
        testequal(12.0, 0.6, 1.5, 9)
        testequal(14.0, 0.24, 1.4, 3)
        testequal(7.5, 0.75, 7.5, -1)
        testequal(15.25, 0.6, 1.0, 11)
        testequal(12.0, 0.6, 1.5, 9)
        testequal(12.2, 12.2, 12.2, -1)
        testequal(67.0, 0.6, 3.0, 13)
        testequal(61.0, 1.1, 6.1, -1)
        testequal(25.8, 0.6, 2.8, 9)
        testequal(110.0, 0.75, 1.09, 33)
        testequal(19.0, 0.75, 1.9, 17)
        testequal(25.8, 0.6, 2.8, 9)
        testequal(41.8, 0.6, 4.8, 9)
        testequal(98.0, 9.0, 9.8, -1)
        testequal(15.9, 1.0, 1.9, -1)
    }
    
    func testRandomExample() {
        func bouncingBallAPO(_ h: Double, _ bounce: Double, _ window: Double) -> Int {
            if (h <= 0) || (window >= h) || (bounce <= 0) || (bounce >= 1) {
                return -1
            }
            var hh = h
            var seen: Int = -1;
            while hh > window {
                seen += 2;
                hh = hh * bounce
            }
            return seen
        }
        let someheights: [Double] = [12, 10.5, 144, 233, 15.25, 61, 98, 15.9, 25.8, 41.8, 67, 109, 17, 28, 46, 7.5, 12.20, 19, 3, 5, 83, 13, 21, 35.5, 57, 92, 14, 24, 39, 6.5]
        let someBounces: [Double] = [0.6, 0.6, 0.6, 0.6, 0.6, 1.1, 9, 1, 0.6, 0.6, 0.6, 0.75, 0.75, 0.75, 0.75, 0.75, 12.20, 0.75, 0.75, 0.83, 0.13, 0.21, 0.35, 0.57, 0.9, 0.14, 0.24, 0.39, 0.65, 0.65]
        let somewin: [Double] = [1.5, 1.5, 1.44, 2.33, 1, 6.1, 9.8, 1.9, 2.8, 4.8, 3, 1.09, 1.7, 2.8, 46, 7.5, 12.20, 1.9, 3, 5, 0.83, 1.3, 2.1, 3.5, 0.57, 0.92, 1.4, 2.4, 3.9, 6.5]
        for _ in 1...10 {
            let rn = Int.random(in: 0..<20)
            let f1 = someheights[rn]
            let f2 = someBounces[rn]
            let f3 = somewin[rn]
            let sol = bouncingBallAPO(f1, f2, f3)
            testequal(f1, f2, f3, sol)
        }
    }
}
