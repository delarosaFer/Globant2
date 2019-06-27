//
//  UIImageView+Utils.swift
//  Resume
//
//  Created by David Castro Cisneros on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

extension UIImageView {
    /**
     Update radius.

     - Important:
     - This method update heigth and width of the image to set his corner radius
     */
    func rounded() {
        self.clipsToBounds =  true
        layer.cornerRadius = max(bounds.height, bounds.width) / 2
    }

    /**
     Changes image's rendering mode and tint color.

     - Parameter color: The tint color.
     - Important: The method does nothing if no `UIImage` has been set when called.
     */
    public func rasterizeWith(color: UIColor) {
        guard let templateImage = self.image?.withRenderingMode(.alwaysTemplate) else {
            return
        }

        self.image = templateImage
        self.tintColor = color
    }
}
