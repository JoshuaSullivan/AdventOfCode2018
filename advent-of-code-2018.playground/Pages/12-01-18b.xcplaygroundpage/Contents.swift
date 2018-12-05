//: # Advent of Code 2018
//: ### 12/01/18 - Puzzle 2
//: ### Chronal Calibration
//:
//: [<- Previous](@previous) | [Next ->](@next)

import Foundation

//: Load the data.
guard
    let inputURL = Bundle.main.url(forResource: "input", withExtension: "txt"),
    let text = try? String(contentsOf: inputURL)
    else {
        fatalError()
}

//: Convert the data into integers.
let values = text.split(separator: "\n").compactMap { Int($0) }

//: Sanity check (does the number of values match the number of lines?
let count = values.count
print("Got \(count) values.")

do {
    let answer = try Solver.solve(for: values)
    print("Answer: \(answer)")
} catch {
    print("Solver failed: \(error.localizedDescription)")
}

