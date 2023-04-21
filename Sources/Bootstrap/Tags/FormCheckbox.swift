import Leaf

public struct FormCheckboxTag: UnsafeUnescapedLeafTag {
    public init() { }
    
    public func render(_ ctx: LeafContext) throws -> LeafData {
        // try ctx.requireNoBody()

        let (classes, attributes) = try parseParameters(ctx)

        var checkbox = "<input type=\"checkbox\" class=\"form-control"

        if let classes {
            checkbox += " \(classes)"
        }

        checkbox += "\""

        if let attributes {
            checkbox += " \(attributes)"
        }

        checkbox += ">"

        return .string(checkbox)
    }
    
    private func parseParameters(_ ctx: LeafContext) throws -> (classes: String?, attributes: String?) {
        let classes = try ctx.parse(index: 0, type: "classes")
        let attributes = try ctx.parse(index: 1, type: "attributes")
        return (classes, attributes)
    }
}
