//
//  TabBarViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var resume: Resume?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request { [weak self] (resume) in
            if let resume = resume {
                self?.resume = resume
            }else {
                print("RESUME ERROR")
            }
        }
    }
    
    func request(completition: @escaping ((Resume?) -> Void)) {
        var response: Resume?
        
        APIClient.shared.getData(handler: { (data, status) in
            if status == .success {
                guard let data = data else { return }
                response = APIClient.shared.parseJSON(data: data, model: response) ?? response
                completition(response)
            } else {
                debugPrint("DATA ERROR")
            }
        })
    }
}
