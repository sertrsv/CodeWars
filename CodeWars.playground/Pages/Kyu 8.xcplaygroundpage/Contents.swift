
let kyu8tests = [
    MultiplyTest.self,
    EvenOrOddTest.self,
    ReversedSequenceTest.self,
    StringyStringsTest.self,
    SumOfPositiveTest.self
]

for test in kyu8tests {
    test.defaultTestSuite.run()
}

//: [Kyu 7](@next)
