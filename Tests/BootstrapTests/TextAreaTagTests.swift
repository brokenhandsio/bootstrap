import Bootstrap
@testable import LeafKit
import XCTest

final class TextAreaTagTests: XCTestCase {
    var textAreaTag: TextAreaTag!
    let tagName = "textArea"

    override func setUpWithError() throws {
        textAreaTag = TextAreaTag()
    }

    func testDefaultTextArea() throws {
        let template = "#textArea"
        let expected = "<textarea class=\"form-control\" rows=\"3\"></textarea>"
        try XCTAssertEqual(
            render(template, tags: [tagName: textAreaTag]),
            expected
        )
    }

    func testTextAreaWithBody() throws {
        let template = "#textArea: Hello, world! #endtextArea"
        let expected = "<textarea class=\"form-control\" rows=\"3\">Hello, world!</textarea>"
        try XCTAssertEqual(
            render(template, tags: [tagName: textAreaTag]),
            expected
        )
    }

    func testTextAreaWithClass() {
        let template = "#textArea(class): Hello, world! #endtextArea"
        let classes = "my-class"
        let expected = "<textarea class=\"form-control my-class\" rows=\"3\">Hello, world!</textarea>"
        let context: [String: LeafData] = ["class": .string(classes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: textAreaTag]),
            expected
        )
    }
}
