import Bootstrap
@testable import LeafKit
import XCTest

final class AlertTagTests: XCTestCase {
    var alertTag: AlertTag!

    override func setUpWithError() throws {
        alertTag = AlertTag()
    }
    
    // MARK: Helpers
    
    private func generateAST(name: String, template: String) throws -> [Syntax] {
        var lexer = LeafLexer(name: name, template: template)
        let tokens = try lexer.lex()
        var parser = LeafParser(name: name, tokens: tokens)
        return try parser.parse()
    }

    private func render(ast: [Syntax], context: [String: LeafData]) throws -> String {
        var serializer = LeafSerializer(ast: ast, tags: ["alert": alertTag], ignoreUnfoundImports: true)
        let view = try serializer.serialize(context: context)
        return view.getString(at: view.readerIndex, length: view.readableBytes) ?? ""
    }

    // MARK: Tests

    func testDefaultAlert() throws {
        let template = "#alert: Hello, world! #endalert"
        let expected = "<div class=\"alert alert-primary\" role=\"alert\">Hello, world!</div>"
        let result = try render(ast: generateAST(name: "alertTests", template: template), context: [:])
        XCTAssertEqual(result, expected)
    }
    
    func testWarningAlertWithStyle() throws {
        let template = "#alert(style): Hello, world! #endalert"
        let style = "warning"
        let expected = "<div class=\"alert alert-warning\" role=\"alert\">Hello, world!</div>"
        let result = try render(
            ast: generateAST(name: "alertTests", template: template),
            context: ["style": .string(style)]
        )
        XCTAssertEqual(result, expected)
    }
    
    func testWarningAlertWithAdditionalClass() throws {
        let template = "#alert(style, classes): Hello, world! #endalert"
        let style = "warning"
        let classes = "my-class"
        let expected = "<div class=\"alert alert-warning my-class\" role=\"alert\">Hello, world!</div>"
        let result = try render(
            ast: generateAST(name: "alertTests", template: template),
            context: ["style": .string(style), "classes": .string(classes)]
        )
        XCTAssertEqual(result, expected)
    }

    func testWarningAlertWithAdditionalClassesAndAttributes() throws {
        let template = "#alert(style, classes, attributes): Hello, world! #endalert"
        let style = "warning"
        let classes = "my-class"
        let attributes = "data-foo=\"bar\" data-baz=\"qux\""
        let expected = "<div class=\"alert alert-warning my-class\" data-foo=\"bar\" data-baz=\"qux\" role=\"alert\">Hello, world!</div>"
        let result = try render(
            ast: generateAST(name: "alertTests", template: template),
            context: ["style": .string(style), "classes": .string(classes), "attributes": .string(attributes)]
        )
        XCTAssertEqual(result, expected)
    }

    func testAlertWithoutBody() throws {
        let template = "#alert: #endalert"
        let expected = "<div class=\"alert alert-primary\" role=\"alert\"></div>"
        let result = try render(
            ast: generateAST(name: "alertTests", template: template),
            context: [:]
        )
        XCTAssertEqual(result, expected)
    }
}
