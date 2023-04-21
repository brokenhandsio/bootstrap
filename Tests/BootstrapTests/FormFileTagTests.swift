import Bootstrap
@testable import LeafKit
import XCTest

final class FormFileTagTests: XCTestCase {
    var formFileTag: FormFileTag!

    override func setUpWithError() throws {
        formFileTag = FormFileTag()
    }

    func testDefaultFormFile() throws {
        let template = "#formFile"
        let expected = "<input type=\"file\" class=\"form-control\">"
        try XCTAssertEqual(
            render(template, tags: ["formFile": formFileTag]),
            expected
        )
    }

    // func testFormFileWithBodyError() throws {
    //     let template = "#formFile: Hello, world! #endformFile"
        
    // }

    func testFormFileWithAdditionalClass() throws {
        let template = "#formFile(classes)"
        let classes = "my-class"
        let expected = "<input type=\"file\" class=\"form-control my-class\">"
        let context: [String: LeafData] = ["classes": .string(classes)]
        try XCTAssertEqual(
            render(template, context, tags: ["formFile": formFileTag]),
            expected
        )
    }
    
   func testFormFileWithAdditionalClassAndAttributes() throws {
       let template = "#formFile(classes, id)"
       let classes = "my-class"
       let attributes = "data-foo=\"bar\" data-baz=\"qux\""
       let expected = "<input type=\"file\" class=\"form-control my-class\" data-foo=\"bar\" data-baz=\"qux\">"
       let context: [String: LeafData] = ["classes": .string(classes), "id": .string(attributes)]
       try XCTAssertEqual(
           render(template, context, tags: ["formFile": formFileTag]),
           expected
       )
   }
}
