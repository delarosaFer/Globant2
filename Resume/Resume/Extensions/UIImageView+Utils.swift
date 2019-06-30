import UIKit

extension UIImageView {
    /**
     Update radius.

     - Important:
     - This method update heigth and width of the image to set his corner radius
     */
    func rounded() {
        self.clipsToBounds =  true
        layer.cornerRadius = max(bounds.height, bounds.width) / 2.0
    }

    /**
     Changes image's rendering mode and tint color.
     
     - Parameter color: The tint color.
     
     - Important: The method does nothing if no `UIImage` has been set when called.
     */
    final public func rasterizeWith(color: UIColor) {
        guard let templateImage = self.image?.withRenderingMode(.alwaysTemplate) else {
            return
        }

        self.image = templateImage
        self.tintColor = color
    }
}
