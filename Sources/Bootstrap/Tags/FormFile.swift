import Leaf

public struct FormFileTag: UnsafeUnescapedLeafTag {
    public init() { }
    
    public func render(_ ctx: LeafContext) throws -> LeafData {
//        try ctx.requireNoBody()

        let (classes, attributes) = try parseParameters(ctx)

        var input = "<input type=\"file\" class=\"form-control"

        if let classes {
            input += " \(classes)"
        }

        input += "\""

        if let attributes {
            input += " \(attributes)"
        }

        input += ">"

        return .string(input)
    }

    private func parseParameters(_ ctx: LeafContext) throws -> (classes: String?, attributes: String?) {
        let classes = try ctx.parse(index: 0, type: "classes")
        let attributes = try ctx.parse(index: 1, type: "attributes")
        return (classes, attributes)
    }
}
