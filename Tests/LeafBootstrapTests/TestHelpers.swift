import XCTest
import NIOConcurrencyHelpers
import NIO
@testable import LeafKit

internal func lex(_ str: String) throws -> [LeafToken] {
    var lexer = LeafLexer(name: "lex-test", template: str)
    return try lexer.lex().dropWhitespace()
}

internal func parse(_ str: String) throws -> [Syntax] {
    var lexer = LeafLexer(name: "alt-parse", template: str)
    let tokens = try! lexer.lex()
    var parser = LeafParser(name: "alt-parse", tokens: tokens)
    let syntax = try! parser.parse()

    return syntax
}

internal func render(name: String = "test-render", _ template: String, _ context: [String: LeafData] = [:], tags: [String: LeafTag]) throws -> String {
    var lexer = LeafLexer(name: name, template: template)
    let tokens = try lexer.lex()
    var parser = LeafParser(name: name, tokens: tokens)
    let ast = try parser.parse()
    var serializer = LeafSerializer(
        ast: ast,
        tags: tags,
        ignoreUnfoundImports: false
    )
    let view = try serializer.serialize(context: context)
    return view.getString(at: view.readerIndex, length: view.readableBytes) ?? ""
}

internal extension Array where Element == LeafToken {
    func dropWhitespace() -> Array<LeafToken> {
        return self.filter { token in
            guard case .whitespace = token else { return true }
            return false
        }
    }
}


