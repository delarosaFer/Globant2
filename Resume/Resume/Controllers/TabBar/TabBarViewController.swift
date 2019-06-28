//
//  TabBarViewController.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

final class TabBarViewController: UITabBarController {
    var presenter: TabBarPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        if let resumeVC = viewControllers?[0] as? ResumeViewController {
            guard resumeVC.presenter == nil else {
                return
            }
            
            resumeVC.presenter = presenter?.makeResumePresenter()
            return
        }
    }
}
