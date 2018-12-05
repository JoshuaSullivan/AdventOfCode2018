//: # Advent of Code 2018
//: ### 12/02/18 - Puzzle 2
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
//: I'm sorting the array so that adjacent strings will vary by as little as possible.
let values = text.split(separator: "\n").sorted()
print("Got \(values.count) values.")

//: Compaire sequential values. When you use the `zip()` operator on a sequence and
//: the subsequence produced by calling `dropFirst()` you get a sequence of tuples
//: containing strings `N` and `N+1` of your original sequence.
let valuePairSequence = zip(values, values.dropFirst())

//: We will filter our pairs of strings to find only the pair that differs by exactly
//: one character.
let result = valuePairSequence.filter { valuePair in
//: Now we're going to zip the 2 strings together. This produces a sequence of
//: tuples containing the corresponding characters in each string.
    let charPairSequence = zip(valuePair.0, valuePair.1)

//: We use the `reduce()` operator on the sequence of corresponding characters
//: to count how many differenes they contain. Remember, we are looking for a
//: pair of strings that only differs by 1 character.
    let numberOfDifferences = charPairSequence.reduce(0) { result, charPair in
    //: We will increase the result by 1 if the characters were different.
    //: Otherwise, leave it as-is.
        return result + (charPair.0 != charPair.1 ? 1 : 0)
    }
//: Now that we know how many characters the strings differed by, we can test
//: if this is the pair we want by testing if they only had 1 difference.
    return numberOfDifferences == 1
}

//: Verify that we did indeed get a result.
guard let pair = result.first else {
    fatalError("Failed to find a result. Maybe your algorithm is dumb?")
}
//: Reduce the 2 strings into a single string consisting of only those
//: characters which are identical. This is our answer.
let answer: String = zip(pair.0, pair.1).reduce("") { result, charPair in
    guard charPair.0 == charPair.1 else {
        return result
    }
    return "\(result)\(charPair.0)"
}
print("Answer: \(answer)")


