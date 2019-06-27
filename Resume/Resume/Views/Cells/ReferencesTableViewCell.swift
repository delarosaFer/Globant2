//
//  ReferencesTableViewCell.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

final class ReferencesTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var phone: UILabel?
    @IBOutlet weak var cellPhone: UILabel?
    @IBOutlet weak var email: UILabel?
    @IBOutlet weak var workplace: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
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
