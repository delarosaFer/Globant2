//
//  ReferencesViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class ReferencesViewController: UIViewController {
    @IBOutlet weak var referencesTableView: UITableView?
    var references: [Reference]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        referencesTableView?.dataSource = self
        referencesTableView?.register(UINib.init(nibName: "ReferencesTableViewCell", bundle: nil), forCellReuseIdentifier: "references")
        
        references = (self.parent as? TabBarViewController)?.resume?.references
        
        referencesTableView?.reloadData()
    }
}

extension ReferencesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return references?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableView = referencesTableView,
            let references = references,
            let cell = tableView.dequeueReusableCell(withIdentifier: "references") as? ReferencesTableViewCell
        else {
                return UITableViewCell()
        }
        
        cell.configureWith(reference: references[indexPath.row])
        return cell
    }
}
