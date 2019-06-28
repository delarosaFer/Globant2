import UIKit

extension UIStackView {
    /// Removes all children from the StackView
    func removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}
