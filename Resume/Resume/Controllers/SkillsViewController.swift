//
//  SkillsViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController {
    
    @IBOutlet weak var skillsTableView: UITableView!
    var skills: [Skill]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skillsTableView?.dataSource = self
        skillsTableView?.register(UINib.init(nibName: "SkillsTableViewCell", bundle: nil), forCellReuseIdentifier: "skills")
        
        skills = (self.parent as? TabBarViewController)?.resume?.skills
        
        skillsTableView?.reloadData()
    }
}

extension SkillsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skills?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableView = skillsTableView,
            let skills = skills,
            let cell = tableView.dequeueReusableCell(withIdentifier: "skills") as? SkillsTableViewCell
            else {
                return UITableViewCell()
        }
        
        cell.configureWith(skill: skills[indexPath.row])
        
        return cell
    }
}

