//
//  ResumeViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {
    
    var sections = ["Education", "Carreer"]
    var rowsPerSection = [1,2]
    
    @IBOutlet weak var profilePhoto: UIImageView?
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var employment: UILabel?
    @IBOutlet weak var summary: UILabel?
    @IBOutlet weak var infoTableView: UITableView?
    @IBOutlet weak var contactButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        setupView()
    }
    
    func registerCells() {
        //MARK: Register cells
        let EducationNib = UINib.init(nibName: "EducationCell", bundle: nil)
        infoTableView?.register(EducationNib, forCellReuseIdentifier: "EducationCell")
        let ExperienceNib = UINib.init(nibName: "ExperienceCell", bundle: nil)
        infoTableView?.register(ExperienceNib, forCellReuseIdentifier: "ExperienceCell")
    }
    
    func setupView() {
        contactButton?.layer.cornerRadius = 9
    }
}
