//: [Kyu 8](@previous)

import XCTest

let kyu7tests = [
    CreditCardMaskTest.self,
    SumOfTwoLowestPositiveIntegersTest.self,
    DontGiveMeFiveTest.self,
    SquareEveryDigitTest.self,
    TriangularTreasureTest.self
]

for test in kyu7tests {
    test.defaultTestSuite.run()
}

//: [Kyu 6](@next)
