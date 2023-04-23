import LeafBootstrap
@testable import LeafKit
import XCTest

final class AlertTagTests: XCTestCase {
    var alertTag: AlertTag!
    let tagName = "alert"

    override func setUpWithError() throws {
        alertTag = AlertTag()
    }

    func testDefaultAlert() throws {
        let template = "#alert: Hello, world! #endalert"
        let expected = "<div class=\"alert alert-primary\" role=\"alert\">Hello, world!</div>"
        try XCTAssertEqual(
            render(template, tags: [tagName: alertTag]),
            expected
        )
    }
    
    func testWarningAlertWithStyle() throws {
        let template = "#alert(style): Hello, world! #endalert"
        let style = "warning"
        let expected = "<div class=\"alert alert-warning\" role=\"alert\">Hello, world!</div>"
        let context: [String: LeafData] = ["style": LeafData.string(style)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: alertTag]),
            expected
        )
    }
    
    func testWarningAlertWithAdditionalClass() throws {
        let template = "#alert(style, classes): Hello, world! #endalert"
        let style = "warning"
        let classes = "my-class"
        let expected = "<div class=\"alert alert-warning my-class\" role=\"alert\">Hello, world!</div>"
        let context: [String: LeafData] = ["style": .string(style), "classes": .string(classes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: alertTag]),
            expected
        )
    }

    func testWarningAlertWithAdditionalClassesAndAttributes() throws {
        let template = "#alert(style, classes, attributes): Hello, world! #endalert"
        let style = "warning"
        let classes = "my-class"
        let attributes = "data-foo=\"bar\" data-baz=\"qux\""
        let expected = "<div class=\"alert alert-warning my-class\" data-foo=\"bar\" data-baz=\"qux\" role=\"alert\">Hello, world!</div>"
        let context: [String: LeafData] = ["style": .string(style), "classes": .string(classes), "attributes": .string(attributes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: alertTag]),
            expected
        )
    }

    func testAlertWithoutBody() throws {
        let template = "#alert: #endalert"
        let expected = "<div class=\"alert alert-primary\" role=\"alert\"></div>"
        try XCTAssertEqual(
            render(template, tags: [tagName: alertTag]),
            expected
        )
    }
}
