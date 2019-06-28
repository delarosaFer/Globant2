import Foundation

final class ContactPresenter {
    private let model: ContactModelType
    
    var phone: String {
        return model.contact.phone
    }
    var cellPhone: String {
        return model.contact.celphone ?? "---"
    }
    var email: String {
        return model.contact.email
    }
    
    init(withModel model: ContactModelType) {
        self.model = model
    }
}

protocol ContactModelType {
    var contact: Contact { get }
}

final class ContactModel: ContactModelType {
    let contact: Contact
    
    required init(withContact contact: Contact) {
        self.contact = contact
    }
}
