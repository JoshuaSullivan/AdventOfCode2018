import Foundation

/// Making this a source file rather than part of the playground
/// increases performance by roughly 1000x. Remember to make everything
/// public or it won't show up in your playground.
///
public struct Solver {

    public enum SolverError: Error {
        case maxCountReached
    }

    /// Perform the repetitive computation outlined in the directions.
    ///
    /// - Parameter forValues: The list of values downloaded from the site.
    /// - Returns: The integer at which the first repeted value was found.
    /// - Throws: Will throw a SolverError.maxCountReached if 1,000,000 repetitions
    ///           are performed without finding a solution.
    ///
    public static func solve(forValues values: [Int]) throws -> Int {
        let count = values.count
        var results: [Int] = []
        var index = 0
        var accumulator = 0
        var answer: Int?
        repeat {
            accumulator += values[index % count]
            guard !results.contains(accumulator) else {
                answer = accumulator
                break
            }
            results.append(accumulator)
            index += 1
        } while index < 1000000
        guard let finalAnswer = answer else { throw SolverError.maxCountReached }
        print("Solver succeeded after \(index) iterations.")
        return finalAnswer
    }
}
