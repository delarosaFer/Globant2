
import UIKit

/// A cell containing references
final class ReferencesTableViewCell: UITableViewCell {
    /// the name of the reference
    @IBOutlet weak var name: UILabel?
    /// the home phone of the reference
    @IBOutlet weak var phone: UILabel?
    /// the cellphone of the reference
    @IBOutlet weak var cellPhone: UILabel?
    /// the email address of the reference
    @IBOutlet weak var email: UILabel?
    /// the workplace information
    @IBOutlet weak var workplace: UILabel?
    
    /// Configures the cell of the reference
    /// - Parameter reference: the referenceer information
    func configureWith(reference: Reference) {
        guard let name = name,
            let email = email,
            let cellPhone = cellPhone,
            let workplace = workplace,
            let phone = phone else {
            return
        }

        name.text = reference.name
        workplace.text = reference.workplace
        email.text = reference.contact.email
        cellPhone.text = reference.contact.celphone
        phone.text = reference.contact.phone
    }
}
