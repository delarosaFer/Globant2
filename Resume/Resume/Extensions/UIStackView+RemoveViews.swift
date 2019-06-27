//
//  UIStackView+RemoveViews.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/27/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

extension UIStackView {
    func removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}
