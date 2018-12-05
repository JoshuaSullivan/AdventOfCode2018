import Foundation

public struct Solver {
    public static func solve(forClaims claims: [Claim]) -> Int {
        var grid: [[Int]] = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: 1000), count: 1000)

        claims.forEach { claim in
            let cols = claim.y..<(claim.y + claim.h)
            let rows = claim.x..<(claim.x + claim.w)
            for y in cols {
                for x in rows {
                    grid[x][y] += 1
                }
            }
        }

        let overlaps: Int = grid.reduce(0) { result, row in
            return result + row.filter({ $0 > 1 }).count
        }

        return overlaps
    }
}
