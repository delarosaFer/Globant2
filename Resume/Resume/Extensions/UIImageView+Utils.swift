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
}
