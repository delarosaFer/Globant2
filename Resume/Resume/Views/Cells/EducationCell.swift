//
//  EducationCell.swift
//  Resume
//
//  Created by Fernando De La Rosa Salas on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class EducationCell: UITableViewCell {
    
    
    @IBOutlet weak var universityName: UILabel?
    @IBOutlet weak var degree: UILabel?
    @IBOutlet weak var state: UILabel?
    @IBOutlet weak var startDate: UILabel?
    @IBOutlet weak var city: UILabel?
    @IBOutlet weak var endDate: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
