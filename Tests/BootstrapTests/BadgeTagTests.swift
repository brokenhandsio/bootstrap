import Bootstrap
@testable import LeafKit
import XCTest

final class BadgeTagTests: XCTestCase {
    var badgeTag: BadgeTag!
    let tagName = "badge"

    override func setUpWithError() throws {
        badgeTag = BadgeTag()
    }

    func testDefaultBadge() throws {
        let template = "#badge: Hello, world! #endbadge"
        let expected = "<span class=\"badge badge-primary\">Hello, world!</span>"
        try XCTAssertEqual(
            render(template, tags: ["badge": badgeTag]),
            expected
        )
    }

    func testWarningBadgeWithStyle() throws {
        let template = "#badge(style): Hello, world! #endbadge"
        let style = "warning"
        let expected = "<span class=\"badge badge-warning\">Hello, world!</span>"
        let context: [String: LeafData] = ["style": .string(style)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: badgeTag]),
            expected
        )
    }

    func testWarningBadgeWithAdditionalClass() throws {
        let template = "#badge(style, classes): Hello, world! #endbadge"
        let style = "warning"
        let classes = "my-class"
        let expected = "<span class=\"badge badge-warning my-class\">Hello, world!</span>"
        let context: [String: LeafData] = ["style": .string(style), "classes": .string(classes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: badgeTag]),
            expected
        )
    }

    func testWarningBadgeWithAdditionalClassesAndAttributes() throws {
        let template = "#badge(style, classes, attributes): Hello, world! #endbadge"
        let style = "warning"
        let classes = "my-class"
        let attributes = "data-foo=\"bar\""
        let expected = "<span class=\"badge badge-warning my-class\" data-foo=\"bar\">Hello, world!</span>"
        let context: [String: LeafData] = ["style": .string(style), "classes": .string(classes), "attributes": .string(attributes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: badgeTag]),
            expected
        )
    }
}
