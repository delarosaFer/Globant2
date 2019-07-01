import Foundation

final class ContactPresenter {
    private let model: ContactModelType

    var phone: String {
        return model.contact.phone ??  NSLocalizedString(LocalizedStringIdentifier.noPhone.rawValue,
                                                         comment: LocalizedStringIdentifier.noPhone.rawValue)
    }
    var cellPhone: String {
        return model.contact.celphone ?? NSLocalizedString(LocalizedStringIdentifier.noPhone.rawValue,
                                                           comment: LocalizedStringIdentifier.noPhone.rawValue)
    }
    var email: String {
        return model.contact.email
    }

    init(withModel model: ContactModelType) {
        self.model = model
    }
}
