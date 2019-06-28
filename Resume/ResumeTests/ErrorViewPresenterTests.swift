
import XCTest
@testable import Resume

class ErrorViewPresenterTests: XCTestCase {
    func testPresenterCreation() {
        let presenter = ErrorViewPresenter(withModel: MockErrorModel())
        XCTAssertEqual("mockError", presenter.errorMessage)
    }
    
    func testModelCreation() {
        let model = ErrorViewModel(error: "Error")
        XCTAssertEqual("Error", model.errorMessage)
    }
}

struct MockErrorModel: ErrorModelType {
    var errorMessage: String = "mockError"
}
