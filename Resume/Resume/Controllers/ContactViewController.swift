import UIKit

final class ContactViewController: UIViewController {
    @IBOutlet weak var phone: UILabel?
    @IBOutlet weak var email: UILabel?
    @IBOutlet weak var cellPhone: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var cellPhoneLabel: UILabel?
    @IBOutlet weak var emailLabel: UILabel?
    var presenter: ContactPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        displayContact()
    }

    private func displayContact() {
        guard let phone = phone,
            let email = email,
            let cellPhone = cellPhone,
            let presenter = presenter else {
                return
        }

        phone.text = NSLocalizedString("phoneLabel", comment: "Phone label")
        cellPhone.text = NSLocalizedString("cellPhoneLabel", comment: "Cell phone label")
        email.text = NSLocalizedString("emailLabel", comment: "Email label")

        phoneLabel?.text = presenter.phone
        emailLabel?.text = presenter.email
        cellPhoneLabel?.text = presenter.cellPhone
    }

    @IBAction func didTapReturn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
