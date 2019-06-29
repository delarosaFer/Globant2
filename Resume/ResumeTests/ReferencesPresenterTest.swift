import XCTest
@testable import Resume

class ReferencesPresenterTest: XCTestCase {
    func testModelCreation() {
        let model = ReferencesModel(withReferences: ReferenceModel().references)
        XCTAssertEqual(model.references.first?.name, "name")
    }

    func testPresenterReferenceCount() {
        let presenter = ReferencesPresenter(withModel: ReferenceModel())
        XCTAssertEqual(presenter.referenceCount, 1)
    }

    func testSuccessfulPresenterReference() {
        let presenter = ReferencesPresenter(withModel: ReferenceModel())
        XCTAssertEqual(presenter.getReference(for: IndexPath.init(row: 0, section: 0))?.name, "name")
    }
}

struct ReferenceModel: ReferencesModelType {
    var references: [Reference] = [Reference.init(name: "name", workplace: "workplace", contact: Contact.init(phone: "phone", celphone: "celphone", email: "email"))]
}
