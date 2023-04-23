import Leaf

public struct InputTag: UnsafeUnescapedLeafTag {
    public init() { }

    enum InputTypeKeys: String {
        case text
        case email
        case password
        case hidden
    }

    public func render(_ ctx: LeafContext) throws -> LeafData {
//        try ctx.requireNoBody()
        let (inputType, classes, attributes) = try parseParameters(ctx)
        
        guard InputTypeKeys(rawValue: inputType) != nil else {
            throw "Wrong argument given: \(inputType)"
        }

        var input = "<input type=\"\(inputType)\" class=\"form-control"

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
    
    private func parseParameters(_ ctx: LeafContext) throws -> (input: String, classes: String?, attributes: String?) {
        let input = try ctx.parse(index: 0, type: "input")
        let classes = try ctx.parse(index: 1, type: "classes")
        let attributes = try ctx.parse(index: 2, type: "attributes")
        
        guard let input else {
            return (InputTypeKeys.text.rawValue, classes, attributes)
        }
        return (input, classes, attributes)
    }
}
