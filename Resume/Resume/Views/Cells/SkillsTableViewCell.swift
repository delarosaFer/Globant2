//
//  SkillsTableViewCell.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class SkillsTableViewCell: UITableViewCell {
    @IBOutlet weak var skillName: UILabel?
    @IBOutlet weak var imageContainer: UIStackView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageContainer?.removeAllSubviews()
    }
    
    func configureWith(skill: Skill) {
        guard let skillName = self.skillName,
            let imageContainer = self.imageContainer else {
            return
        }
        
        skillName.text = skill.skill
        
        for level in 1...5 {
            let image: UIImageView = level > skill.rating ? UIImageView(image: UIImage(named: "empty")) : UIImageView(image: UIImage(named: "science"))
            image.clipsToBounds = true
            image.contentMode = .scaleAspectFit
            
            imageContainer.addArrangedSubview(image)
        }
    }
}
