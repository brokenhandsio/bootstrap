import Leaf

public struct ButtonTag: UnsafeUnescapedLeafTag {
    public init() { }

    /// A button style can be any of `ColorKeys` or "link".
    public enum Keys: String {
        case link
    }

    public func render(_ ctx: LeafContext) throws -> LeafData {
        var style = ColorKeys.primary.rawValue
        if ctx.parameters.count > 0 {
            guard let param = ctx.parameters[0].string else {
                throw "Bootstrap: wrong type given (expected a string): \(type(of: ctx.parameters[0]))"
            }
            
            if !param.isEmpty {
                style = param
            }
        }
        
        guard ColorKeys(rawValue: style) != nil || Keys(rawValue: style) != nil else {
            throw "Bootstrap: wrong style argument given: \(style)"
        }

        let (classes, attributes) = (try ctx.parseClasses(), try ctx.parseAttributes())

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
}
