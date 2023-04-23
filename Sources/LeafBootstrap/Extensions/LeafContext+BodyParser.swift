import Leaf

extension LeafContext {
    /// Returns the raw body of the tag.
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
    
    func getCustomTagBody() throws -> String {
        try self.requireBody().compactMap { element in
            guard case .custom(_) = element else {
                return nil
            }
            return "#" + element.description
                .replacingOccurrences(of: "\n", with: "")
                .trimmingCharacters(in: .whitespaces)
        }
        .filter { !$0.isEmpty }
        .joined()
    }
}
