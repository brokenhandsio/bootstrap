import Leaf

extension LeafContext {
    /// Creates a string from the raw body of the tag
    func getRawTagBody() throws -> String {
        try self.requireBody().compactMap { element in
            guard case .raw(let byteBuffer) = element else {
                return nil
            }
            return .init(buffer: byteBuffer)
                .replacingOccurrences(of: "\n", with: "")
                .trimmingCharacters(in: .whitespaces)
        }
        .filter { !$0.isEmpty }
        .joined()
    }
}
