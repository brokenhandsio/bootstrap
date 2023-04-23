import LeafBootstrap
@testable import LeafKit
import XCTest

class InputTagTests: XCTestCase {
    var inputTag: InputTag!
    let tagName = "input"

    override func setUpWithError() throws {
        inputTag = InputTag()
    }

    func testDefaultInput() throws {
        let template = "#input()"
        let expected = "<input type=\"text\" class=\"form-control\">"
        try XCTAssertEqual(
            render(template, tags: ["input": inputTag]),
            expected
        )
    }

    func testInputWithType() throws {
        let template = "#input(type)"
        let type = "email"
        let expected = "<input type=\"email\" class=\"form-control\">"
        try XCTAssertEqual(
            render(template, ["type": .string(type)], tags: ["input": inputTag]),
            expected
        )
    }

    func testInputWithAdditionalClass() throws {
        let template = "#input(type, classes)"
        let type = "email"
        let classes = "my-class"
        let expected = "<input type=\"email\" class=\"form-control my-class\">"
        try XCTAssertEqual(
            render(template, ["type": .string(type), "classes": .string(classes)], tags: ["input": inputTag]),
            expected
        )
    }

    func testInputWithAdditionalClassesAndAttributes() throws {
        let template = "#input(type, classes, attributes)"
        let type = "email"
        let classes = "my-class"
        let attributes = "required"
        let expected = "<input type=\"email\" class=\"form-control my-class\" required>"
        try XCTAssertEqual(
            render(template, ["type": .string(type), "classes": .string(classes), "attributes": .string(attributes)], tags: ["input": inputTag]),
            expected
        )
    }
}
