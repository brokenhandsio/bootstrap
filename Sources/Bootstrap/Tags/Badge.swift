import Leaf

public struct BadgeTag: UnsafeUnescapedLeafTag {
    public init() { }
    
    public func render(_ ctx: LeafContext) throws -> LeafData {
        let (style, classes, attributes) = try ctx.parseBootstrapParameters()
        
        let body = try ctx.getRawTagBody()
        
        var badge = "<span class=\"badge badge-\(style)"
        if let classes {
            badge += " \(classes)"
        }
        
        badge += "\""
        
        if let attributes {
            badge += " \(attributes)"
        }
        
        badge += ">\(body)</span>"
        
        return .string(badge)
    }
}
