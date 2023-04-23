import Leaf

/// Bootstrap Alert class
/// See https://getbootstrap.com/docs/5.2/components/alerts/
public struct AlertTag: UnsafeUnescapedLeafTag {
    public init() { }
    
    public func render(_ ctx: LeafContext) throws -> LeafData {
        let (style, classes, attributes) = try parseParameters(ctx)
        
        guard ColorKeys(rawValue: style) != nil else {
            throw "Bootstrap: wrong style argument given: \(style)"
        }

        let body = try ctx.getRawTagBody()
        
        var alert = "<div class=\"alert alert-\(style)"
        if let classes {
            alert += " \(classes)"
        }
        
        alert += "\""
        
        if let attributes {
            alert += " \(attributes)"
        }
        
        alert += " role=\"alert\">\(body)</div>"
        
        return .string(alert)
    }
    
    private func parseParameters(_ ctx: LeafContext) throws -> (style: String, classes: String?, attributes: String?) {
        let style = try ctx.parse(index: 0, type: "style")
        let classes = try ctx.parse(index: 1, type: "classes")
        let attributes = try ctx.parse(index: 2, type: "attributes")
        
        guard let style else {
            return (ColorKeys.primary.rawValue, classes, attributes)
        }
        return (style, classes, attributes)
    }
}
