//
//  ErrorViewController.swift
//  Resume
//
//  Created by Fernando De La Rosa Salas on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

class ErrorViewController: UIViewController {
    
    var errorMsg: String?
    
    
    @IBOutlet weak var errorView: UIView?
    @IBOutlet weak var errorMessage: UILabel?
    @IBOutlet weak var refreshButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        errorView?.layer.borderColor = UIColor.darkColor.cgColor
        errorView?.layer.borderWidth = 1
        
        errorMessage?.text = errorMsg
        
        refreshButton?.layer.cornerRadius = 9
    }
    
    @IBAction func tapRefresh(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
        
    }
}