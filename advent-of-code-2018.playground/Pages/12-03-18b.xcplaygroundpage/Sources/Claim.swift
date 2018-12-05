import Foundation

public struct Claim {
    private static let nonNumericSet = CharacterSet(charactersIn: "1234567890").inverted

    public let id: String
    public let x: Int
    public let y: Int
    public let w: Int
    public let h: Int

    public init(encodedString: String.SubSequence) {
        let majorParts = encodedString.split(separator: " ")
        guard majorParts.count == 4 else {
            preconditionFailure("Unexpected string format.")
        }
        id = String(majorParts[0].trimmingCharacters(in: Claim.nonNumericSet))

        // Get the x and y offset.
        let offset = majorParts[2].split(separator: ",")
            .map { $0.trimmingCharacters(in: Claim.nonNumericSet) } // Remove the pesky colons.
            .compactMap { Int($0) }
        guard offset.count == 2 else {
            preconditionFailure("Couldn't find 2 components for the offset.")
        }
        x = offset[0]
        y = offset[1]

        // Get the width and height.
        let size = majorParts[3].split(separator: "x").compactMap { Int($0) }
        guard size.count == 2 else {
            preconditionFailure("Couldn't find 2 components for the size.")
        }
        w = size[0]
        h = size[1]
    }
}
