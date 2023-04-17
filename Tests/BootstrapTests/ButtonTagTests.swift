import Bootstrap
@testable import LeafKit
import XCTest

final class ButtonTagTests: XCTestCase {
    var buttonTag: ButtonTag!

    override func setUpWithError() throws {
        buttonTag = ButtonTag()
    }

    // MARK: Helpers

    private func generateAST(name: String, template: String) throws -> [Syntax] {
        var lexer = LeafLexer(name: name, template: template)
        let tokens = try lexer.lex()
        var parser = LeafParser(name: name, tokens: tokens)
        return try parser.parse()
    }

    private func render(ast: [Syntax], context: [String: LeafData]) throws -> String {
        var serializer = LeafSerializer(ast: ast, tags: ["button": buttonTag], ignoreUnfoundImports: true)
        let view = try serializer.serialize(context: context)
        return view.getString(at: view.readerIndex, length: view.readableBytes) ?? ""
    }

    // MARK: Tests

    func testDefaultButton() throws {
        let template = "#button: Hello, world! #endbutton"
        let expected = "<button class=\"btn btn-primary\">Hello, world!</button>"
        let result = try render(ast: generateAST(name: "buttonTests", template: template), context: [:])
        XCTAssertEqual(result, expected)
    }

    func testLinkButtonWithStyle() throws {
        let template = "#button(style): Hello, world! #endbutton"
        let style = "link"
        let expected = "<button class=\"btn btn-link\">Hello, world!</button>"
        let result = try render(
            ast: generateAST(name: "buttonTests", template: template),
            context: ["style": .string(style)]
        )
        XCTAssertEqual(result, expected)
    }

    func testLinkButtonWithAdditionalClass() throws {
        let template = "#button(style, classes): Hello, world! #endbutton"
        let style = "link"
        let classes = "my-class"
        let expected = "<button class=\"btn btn-link my-class\">Hello, world!</button>"
        let result = try render(
            ast: generateAST(name: "buttonTests", template: template),
            context: ["style": .string(style), "classes": .string(classes)]
        )
        XCTAssertEqual(result, expected)
    }

    func testLinkButtonWithAdditionalClassesAndAttributes() throws {
        let template = "#button(style, classes, attributes): Hello, world! #endbutton"
        let style = "link"
        let classes = "my-class"
        let attributes = "data-foo=\"bar\""
        let expected = "<button class=\"btn btn-link my-class\" data-foo=\"bar\">Hello, world!</button>"
        let result = try render(
            ast: generateAST(name: "buttonTests", template: template),
            context: ["style": .string(style), "classes": .string(classes), "attributes": .string(attributes)]
        )
        XCTAssertEqual(result, expected)
    }
}
