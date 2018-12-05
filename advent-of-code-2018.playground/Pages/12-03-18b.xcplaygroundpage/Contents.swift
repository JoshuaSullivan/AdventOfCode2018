//: # Advent of Code 2018
//: ### 12/03/18 - Puzzle 2
//: ### No Matter How You Slice It
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

//: Convert the data into an array of strings.
let values = text.split(separator: "\n")
print("Got \(values.count) values.")

let claims = values.map { Claim(encodedString: $0) }
let result = Solver.solve(forClaims: claims)

print("Answer: \(result)")
