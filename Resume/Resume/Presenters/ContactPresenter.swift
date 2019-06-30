import Foundation

final class ContactPresenter {
    private let model: ContactModelType

    var phone: String {
        return model.contact.phone ?? NSLocalizedString("nilPhone", comment: "Not cell phone")
    }
    var cellPhone: String {
        return model.contact.celphone ?? NSLocalizedString("nilPhone", comment: "Not cell phone")
    }
    var email: String {
        return model.contact.email
    }

    init(withModel model: ContactModelType) {
        self.model = model
    }
}
