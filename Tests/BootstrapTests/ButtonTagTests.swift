import Bootstrap
@testable import LeafKit
import XCTest

final class ButtonTagTests: XCTestCase {
    var buttonTag: ButtonTag!
    let tagName = "button"

    override func setUpWithError() throws {
        buttonTag = ButtonTag()
    }

    func testDefaultButton() throws {
        let template = "#button: Hello, world! #endbutton"
        let expected = "<button class=\"btn btn-primary\">Hello, world!</button>"
        try XCTAssertEqual(
            render(template, tags: ["button": buttonTag]),
            expected
        )
    }

    func testLinkButtonWithStyle() throws {
        let template = "#button(style): Hello, world! #endbutton"
        let style = "link"
        let expected = "<button class=\"btn btn-link\">Hello, world!</button>"
        let context: [String: LeafData] = ["style": .string(style)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: buttonTag]),
            expected
        )
    }

    func testLinkButtonWithAdditionalClass() throws {
        let template = "#button(style, classes): Hello, world! #endbutton"
        let style = "link"
        let classes = "my-class"
        let expected = "<button class=\"btn btn-link my-class\">Hello, world!</button>"
        let context: [String: LeafData] = ["style": .string(style), "classes": .string(classes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: buttonTag]),
            expected
        )
    }

    func testLinkButtonWithAdditionalClassesAndAttributes() throws {
        let template = "#button(style, classes, attributes): Hello, world! #endbutton"
        let style = "link"
        let classes = "my-class"
        let attributes = "data-foo=\"bar\""
        let expected = "<button class=\"btn btn-link my-class\" data-foo=\"bar\">Hello, world!</button>"
        let context: [String: LeafData] = ["style": .string(style), "classes": .string(classes), "attributes": .string(attributes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: buttonTag]),
            expected
        )
    }
}
