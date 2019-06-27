//
//  ContactViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var phone: UILabel?
    @IBOutlet weak var email: UILabel?
    @IBOutlet weak var cellPhone: UILabel?
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayContact() {
        guard let phone = phone,
            let email = email,
            let cellPhone = cellPhone,
            let contact = contact else {
                return
        }
        
        phone.text = contact.celphone
        email.text = contact.email
        cellPhone.text = contact.celphone
    }
    
    @IBAction func didTapReturn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
