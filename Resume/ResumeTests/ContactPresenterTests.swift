
import XCTest
@testable import Resume

class ContactPresenterTests: XCTestCase {
    func testCreateModal() {
        let modal = ContactModel.init(withContact: MockContactModel().contact)
        
        XCTAssertEqual(modal.contact.email, "test@gmail.com")
    }
    
    func testPresenterProperties() {
        let presenter = ContactPresenter(withModel: MockContactModel())
        
        XCTAssertEqual(presenter.email, "test@gmail.com")
        XCTAssertEqual(presenter.phone, "123")
        XCTAssertEqual(presenter.cellPhone, "345")
    }
}

struct MockContactModel: ContactModelType {
    var contact: Contact = Contact.init(phone: "123", celphone: "345", email: "test@gmail.com")
}
