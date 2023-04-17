import Leaf

extension LeafContext {
    /// Parses the parameters of a Bootstrap tag.
    /// - Parameter ctx: The Leaf context.
    /// - Returns: The parsed style, classes and attributes.
    func parseBootstrapParameters() throws -> (style: ColorKeys, classes: String?, attributes: String?) {
        let style = try parseStyle()
        let classes = try parseClasses()
        let attributes = try parseAttributes()
        
        return (style, classes, attributes)
    }

    /// Parses the style parameter of a Bootstrap tag.
    /// - Parameter ctx: The Leaf context.
    /// - Returns: The parsed style.
    func parseStyle() throws -> ColorKeys {
        var styleParam: String? = nil
        if self.parameters.count > 0 {
            guard let param = self.parameters[0].string else {
                throw "Bootstrap: wrong type given (expected a string): \(type(of: self.parameters[0]))"
            }
            
            if !param.isEmpty {
                styleParam = param
            }
        }
        
        guard let styleParam else {
            return .primary
        }
        
        guard let parsedStyle = ColorKeys(rawValue: styleParam) else {
            throw "Bootstrap: wrong style argument given: \(styleParam)"
        }
        return parsedStyle
    }
    
    /// Parses the additional classes parameter of a Bootstrap tag.
    /// - Returns: The parsed additional classes.
    func parseClasses() throws -> String? {
        var classesParam: String? = nil
        if self.parameters.count > 1 {
            guard let param = self.parameters[1].string else {
                throw "Bootstrap: wrong additional class type given (expected a string): \(type(of: self.parameters[1]))"
            }
            
            if !param.isEmpty {
                classesParam = param
            }
        }
        
        return classesParam
    }
    
    /// Parses the additional attributes parameter of a Bootstrap tag.
    /// - Returns: The parsed additional attributes.
    func parseAttributes() throws -> String? {
        var attributesParam: String? = nil
        if self.parameters.count > 2 {
            guard let param = self.parameters[2].string else {
                throw "Bootstrap: wrong additional attribute type given (expected a string): \(type(of: self.parameters[2]))"
            }
            
            if !param.isEmpty {
                attributesParam = param
            }
        }
        
        return attributesParam
    }
}
