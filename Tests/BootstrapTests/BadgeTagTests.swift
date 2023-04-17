import Bootstrap
@testable import LeafKit
import XCTest

final class BadgeTagTests: XCTestCase {
    var badgeTag: BadgeTag!

    override func setUpWithError() throws {
        badgeTag = BadgeTag()
    }

    // MARK: Helpers

    private func generateAST(name: String, template: String) throws -> [Syntax] {
        var lexer = LeafLexer(name: name, template: template)
        let tokens = try lexer.lex()
        var parser = LeafParser(name: name, tokens: tokens)
        return try parser.parse()
    }

    private func render(ast: [Syntax], context: [String: LeafData]) throws -> String {
        var serializer = LeafSerializer(ast: ast, tags: ["badge": badgeTag], ignoreUnfoundImports: true)
        let view = try serializer.serialize(context: context)
        return view.getString(at: view.readerIndex, length: view.readableBytes) ?? ""
    }

    // MARK: Tests

    func testDefaultBadge() throws {
        let template = "#badge: Hello, world! #endbadge"
        let expected = "<span class=\"badge badge-primary\">Hello, world!</span>"
        let result = try render(ast: generateAST(name: "badgeTests", template: template), context: [:])
        XCTAssertEqual(result, expected)
    }

    func testWarningBadgeWithStyle() throws {
        let template = "#badge(style): Hello, world! #endbadge"
        let style = "warning"
        let expected = "<span class=\"badge badge-warning\">Hello, world!</span>"
        let result = try render(
            ast: generateAST(name: "badgeTests", template: template),
            context: ["style": .string(style)]
        )
        XCTAssertEqual(result, expected)
    }

    func testWarningBadgeWithAdditionalClass() throws {
        let template = "#badge(style, classes): Hello, world! #endbadge"
        let style = "warning"
        let classes = "my-class"
        let expected = "<span class=\"badge badge-warning my-class\">Hello, world!</span>"
        let result = try render(
            ast: generateAST(name: "badgeTests", template: template),
            context: ["style": .string(style), "classes": .string(classes)]
        )
        XCTAssertEqual(result, expected)
    }

    func testWarningBadgeWithAdditionalClassesAndAttributes() throws {
        let template = "#badge(style, classes, attributes): Hello, world! #endbadge"
        let style = "warning"
        let classes = "my-class"
        let attributes = "data-foo=\"bar\""
        let expected = "<span class=\"badge badge-warning my-class\" data-foo=\"bar\">Hello, world!</span>"
        let result = try render(
            ast: generateAST(name: "badgeTests", template: template),
            context: ["style": .string(style), "classes": .string(classes), "attributes": .string(attributes)]
        )
        XCTAssertEqual(result, expected)
    }
}
