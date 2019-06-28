
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

