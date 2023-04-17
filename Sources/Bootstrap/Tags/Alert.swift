import Leaf

/// Bootstrap Alert Tag
/// See https://getbootstrap.com/docs/5.2/components/alerts/
public struct AlertTag: UnsafeUnescapedLeafTag {
    public init() { }
    
    public func render(_ ctx: LeafContext) throws -> LeafData {
        let (style, classes, attributes) = try ctx.parseBootstrapParameters()

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
}
