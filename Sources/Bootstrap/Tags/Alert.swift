import Leaf

/// Bootstrap Alert Tag
public struct AlertTag: UnsafeUnescapedLeafTag {
    public init() { }
    
    public func render(_ ctx: LeafContext) throws -> LeafData {
        var style = ColorKeys.primary.rawValue
        var classes: String?
        var attributes: String?
        
        // Check if the style is provided
        if ctx.parameters.count > 0 {
            guard let param = ctx.parameters[0].string else {
                throw "Bootstrap: wrong type given (expected a string): \(type(of: ctx.parameters[0]))"
            }

            if !param.isEmpty {
                style = param
            }
        }
        
        guard let parsedStyle = ColorKeys(rawValue: style) else {
            throw "Bootstrap: wrong style argument given: \(style)"
        }

        // Check if additional classes are provided
        if ctx.parameters.count > 1 {
            guard let param = ctx.parameters[1].string else {
                throw "Bootstrap: wrong additional class type given (expected a string): \(type(of: ctx.parameters[1]))"
            }

            if !param.isEmpty {
                classes = param
            }
        }

        // Check if additional attributes are provided
        if ctx.parameters.count > 2 {
            guard let param = ctx.parameters[2].string else {
                throw "Bootstrap: wrong additional attribute type given (expected a string): \(type(of: ctx.parameters[2]))"
            }

            if !param.isEmpty {
                attributes = param
            }
        }
        
        let body = try ctx.getRawTagBody()
        
        // Build and return the newly created alrrt
        var alert = "<div class=\"alert alert-\(parsedStyle)"
        if let classes {
            alert += " \(classes)"
        }
        
        alert += "\" \(attributes ?? "") role='alert'>\(body)</div>"
        
        return .string(alert)
    }
}
