//
//  ResumeViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {
    @IBOutlet weak var profilePhoto: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var employment: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var skillsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
