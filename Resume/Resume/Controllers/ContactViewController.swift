
import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var phone: UILabel?
    @IBOutlet weak var email: UILabel?
    @IBOutlet weak var cellPhone: UILabel?
    @IBOutlet weak var phoneLabel: UILabel?
    @IBOutlet weak var cellPhoneLabel: UILabel?
    @IBOutlet weak var emailLable: UILabel?
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayContact()
    }
    
    func displayContact() {
        guard let phone = phone,
            let email = email,
            let cellPhone = cellPhone,
            let contact = contact else {
                return
        }
        
        phone.text = NSLocalizedString("phoneLabel", comment: "Phone label")
        cellPhone.text = NSLocalizedString("cellPhoneLabel", comment: "Cell phone label")
        email.text = NSLocalizedString("emailLabel", comment: "Email label")
        
        phoneLabel?.text = contact.celphone
        emailLable?.text = contact.email
        cellPhoneLabel?.text = contact.celphone
    }
    
    @IBAction func didTapReturn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
