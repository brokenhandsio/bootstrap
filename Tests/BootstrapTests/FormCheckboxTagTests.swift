import Bootstrap
@testable import LeafKit
import XCTest

final class FormCheckboxTagTests: XCTestCase {
    var formCheckboxTag: FormCheckboxTag!
    let tagName = "formCheckbox"

    override func setUpWithError() throws {
        formCheckboxTag = FormCheckboxTag()
    }

    func testDefaultFormCheckbox() throws {
        let template = "#formCheckbox"
        let expected = "<input type=\"checkbox\" class=\"form-control\">"
        try XCTAssertEqual(
            render(template, tags: ["formCheckbox": formCheckboxTag]),
            expected
        )
    }

    // func testFormCheckboxWithBodyError() throws {
    //     let template = "#formCheckbox: Hello, world! #endformCheckbox"
    // }

    func testFormCheckboxWithAdditionalClass() throws {
        let template = "#formCheckbox(classes)"
        let classes = "my-class"
        let expected = "<input type=\"checkbox\" class=\"form-control my-class\">"
        let context: [String: LeafData] = ["classes": .string(classes)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: formCheckboxTag]),
            expected
        )
    }
    
    func testFormCheckboxWithChecked() throws {
        let template = "#formCheckbox(\"\", checked)"
        let checked = "checked"
        let expected = "<input type=\"checkbox\" class=\"form-control\" checked>"
        let context: [String: LeafData] = ["checked": .string(checked)]
        try XCTAssertEqual(
            render(template, context, tags: [tagName: formCheckboxTag]),
            expected
        )
    }
}
