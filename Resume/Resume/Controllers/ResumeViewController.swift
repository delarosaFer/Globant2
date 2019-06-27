//
//  ResumeViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class ResumeViewController: UIViewController {
    
    var client = APIClient()
    var educationSection = String()
    var experienceSection = String()
    var sections = [String]()
    var rowsPerSection = [0, 0]
    
    var resume: Resume? {
        didSet {
            reloadInfo()
        }
    }
    
    @IBOutlet weak var profilePhoto: UIImageView?
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var employment: UILabel?
    @IBOutlet weak var summary: UILabel?
    @IBOutlet weak var infoTableView: UITableView?
    @IBOutlet weak var contactButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resume = (self.parent as? TabBarViewController)?.resume

        registerCells()
        setupView()
        
        infoTableView?.reloadData()
    }
    
    func reloadInfo() {
        name?.text = resume?.name
        employment?.text = resume?.employment
        summary?.text = resume?.summary
        
        rowsPerSection.removeAll()
        rowsPerSection.append(1)
        rowsPerSection.append(resume?.experience.count ?? 0)
        
        requestImage(urlStr: resume?.profilePhoto ?? "") { (data) in
            DispatchQueue.main.async {
                self.profilePhoto?.image = UIImage(data: data)
            }
        }
        
        infoTableView?.reloadData()
    }
    
    func registerCells() {
        //MARK: Register cells
        let EducationNib = UINib.init(nibName: "EducationCell", bundle: nil)
        infoTableView?.register(EducationNib, forCellReuseIdentifier: "EducationCell")
        let ExperienceNib = UINib.init(nibName: "ExperienceCell", bundle: nil)
        infoTableView?.register(ExperienceNib, forCellReuseIdentifier: "ExperienceCell")
    }
    
    func setupView() {
        educationSection = NSLocalizedString("educationTitle", comment: "Education title")
        experienceSection = NSLocalizedString("experienceTitle", comment: "Experience title")
        
        sections = [educationSection, experienceSection]
        
        contactButton?.layer.cornerRadius = 9
        profilePhoto?.rounded()
    }
    
    func requestImage(urlStr: String, completition: @escaping ((Data) -> Void)) {
        guard let url = URL(string: urlStr) else { return }

        client.getData(url: url) { (data, status) in
            if status == .success {
                guard let data = data else { return }
                completition(data)
            }
        }
    }
}
