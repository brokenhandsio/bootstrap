import Leaf

public struct TextAreaTag: UnsafeUnescapedLeafTag {
    public init() { }
    public func render(_ ctx: LeafContext) throws -> LeafData {
//        try ctx.requireNoBody()
        
        let (classes, attributes) = try parseParameters(ctx)
        
        let body = try ctx.getRawTagBody()

        var textArea = "<textarea class=\"form-control"

        if let classes {
            textArea += " \(classes)"
        }

        textArea += "\" rows=\"3\""

        if let attributes {
            textArea += " \(attributes)"
        }

        textArea += ">\(body)</textarea>"

        return .string(textArea)
    }

    func parseParameters(_ ctx: LeafContext) throws -> (classes: String?, attributes: String?) {
        let classes = try ctx.parse(index: 0, type: "classes")
        let attributes = try ctx.parse(index: 1, type: "attributes")
        return (classes, attributes)
    }
}
