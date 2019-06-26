//
//  TryViewController.swift
//  Resume
//
//  Created by Fernando De La Rosa Salas on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class TryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request { (resume) in
            if let resume = resume {
                print(resume)
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
