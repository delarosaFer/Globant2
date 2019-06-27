//
//  MainViewController.swift
//  Resume
//
//  Created by Fernando De La Rosa Salas on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var resume: Resume?
    var errorMessage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(anixmated)
        setupData()
    }
    
    func setupData() {
        request { [weak self] (resume) in
            if let resume = resume {
                DispatchQueue.main.async {
                    self?.resume = resume
                    self?.performSegue(withIdentifier: "StartSegue", sender: nil)
                }
                
            }else {
                DispatchQueue.main.async {
                    self?.errorMessage = NSLocalizedString("errorParse", comment: "Parsing was wrong")
                    self?.performSegue(withIdentifier: "ErrorSegue", sender: nil)
                }
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
                DispatchQueue.main.async {
                    self.errorMessage = NSLocalizedString("errorRequest", comment: "Parsing was wrong")
                    self.performSegue(withIdentifier: "ErrorSegue", sender: nil)
                }
            }
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TabBarViewController {
            destination.resume = self.resume
        }else if let destination = segue.destination as? ErrorViewController {
            destination.errorMsg = self.errorMessage
        }
    }
}
