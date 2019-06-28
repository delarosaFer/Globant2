protocol ContactModelType {
    var contact: Contact { get }
}

final class ContactModel: ContactModelType {
    let contact: Contact

    required init(withContact contact: Contact) {
        self.contact = contact
    }
}
