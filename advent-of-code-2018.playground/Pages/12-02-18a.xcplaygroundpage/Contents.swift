//: # Advent of Code 2018
//: ### 12/02/18 - Puzzle 1
//: ### Inventory Management System
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

//: This method counts the frequency of each character that
//: appears in the string. This will allow us to test if any paricular
//: string contains a character that appears 2 or 3 times.
func histogram(of string: String.SubSequence) -> [Character : Int] {
    return string.reduce(into: [:]) { hist, char in
        hist[char, default: 0] += 1
    }
}

//: Iterate through all of the strings, creating a histogram for each
//: and checking if they had any characters appear 2 or 3 times.
let counts: (Int, Int) = values.reduce((0, 0)) { counts, string in
    let hist = histogram(of: string)
    let values = Array(hist.values)
    let twosCount = counts.0 + (values.contains(2) ? 1 : 0)
    let threesCount = counts.1 + (values.contains(3) ? 1 : 0)
    return (twosCount, threesCount)
}
print("Final counts: \(counts)")

let answer = counts.0 * counts.1
print("Answer: \(answer)")


