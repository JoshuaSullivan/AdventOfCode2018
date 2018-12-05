import Foundation

public struct Solver {
    public static func solve(forClaims claims: [Claim]) -> Claim {
        var grid: [[Int]] = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: 1000), count: 1000)

        // First, "paint" the grid.
        claims.forEach { claim in
            let cols = claim.y..<(claim.y + claim.h)
            let rows = claim.x..<(claim.x + claim.w)
            for y in cols {
                for x in rows {
                    grid[x][y] += 1
                }
            }
        }

        // Now, look for a claim which has an area score equal to its area.
        let result = claims.filter { claim in
            let cols = claim.y..<(claim.y + claim.h)
            let rows = claim.x..<(claim.x + claim.w)
            var sum = 0
            for y in cols {
                for x in rows {
                    sum += grid[x][y]
                }
            }
            return sum == claim.w * claim.h
        }

        guard result.count == 1 else {
            preconditionFailure("Should not have found more than 1 result.")
        }

        return result[0]
    }
}
