import Leaf

/// Bootstrap Button class
/// See https://getbootstrap.com/docs/5.2/components/buttons/
public struct ButtonTag: UnsafeUnescapedLeafTag {
    public init() { }

    /// A button style can be any of `ColorKeys` or "link".
    public enum Keys: String {
        case link
    }

    public func render(_ ctx: LeafContext) throws -> LeafData {
        let (style, classes, attributes) = try parseParameters(ctx)

        guard
            ColorKeys(rawValue: style) != nil || Keys(rawValue: style) != nil
        else {
            throw "Bootstrap: wrong style argument given: \(style)"
        }

        let body = try ctx.getRawTagBody()

        var button = "<button class=\"btn btn-\(style)"
        if let classes {
            button += " \(classes)"
        }

        button += "\""

        if let attributes {
            button += " \(attributes)"
        }

        button += ">\(body)</button>"

        return .string(button)
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
