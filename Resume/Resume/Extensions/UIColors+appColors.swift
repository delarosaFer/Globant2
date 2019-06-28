import UIKit

extension UIColor {
    /**
     Creates `UIColor` instances with the values given in `Colors.xcassets`
     */
    static var primaryColor: UIColor {
        return UIColor.init(named: "primary-color") ?? UIColor.green
    }

    /**
     Creates UIColor instances with the values given in `Colors.xcassets`
     */
    static var secondaryColor: UIColor {
        return UIColor.init(named: "secondary-color") ?? UIColor.purple
    }

    /**
     Creates UIColor instances with the values given in `Colors.xcassets`
     */
    static var backgroundColor: UIColor {
        return UIColor.init(named: "background-color") ?? UIColor.darkGray
    }

    /**
     Creates UIColor instances with the values given in `Colors.xcassets`
     */
    static var darkColor: UIColor {
        return UIColor.init(named: "dark-color") ?? UIColor.red
    }
}
