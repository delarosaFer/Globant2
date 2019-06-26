//
//  UIColors+appColors.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     Creates `UIColor` instances with the values given in `Colors.xcassets`
     */
    public static var primaryColor: UIColor {
        return UIColor.init(named: "primary-color") ?? UIColor.orange
    }
    
    /**
     Creates UIColor instances with the values given in `Colors.xcassets`
     */
    public static var secondaryColor: UIColor {
        return UIColor.init(named: "secondary-color") ?? UIColor.cyan
    }
    
    /**
     Creates UIColor instances with the values given in `Colors.xcassets`
     */
    public static var backgroundColor: UIColor {
        return UIColor.init(named: "background-color") ?? UIColor.lightGray
    }
}
