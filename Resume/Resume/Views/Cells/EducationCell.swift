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
    }
    
    func configureWith(education: Education) {
        guard let universityName = universityName,
            let degree = degree,
            let state = state,
            let city = city,
            let startDate = startDate,
            let endDate = endDate else {
                return
        }
        
        universityName.text = education.universityName
        degree.text = education.degree
        state.text = education.state
        city.text = education.city
        startDate.text = education.startDate
        endDate.text = education.endDate ?? NSLocalizedString("currentDate", comment: "Unfinished education")
    }
}
