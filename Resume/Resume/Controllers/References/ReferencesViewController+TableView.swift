//
//  ReferencesViewController+TableView.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

extension ReferencesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.referenceCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableView = referencesTableView,
            let reference = presenter?.getReference(for: indexPath),
            let cell = tableView.dequeueReusableCell(withIdentifier: "references") as? ReferencesTableViewCell
            else {
                return UITableViewCell()
        }
        
        cell.configureWith(reference: reference)
        return cell
    }
}
