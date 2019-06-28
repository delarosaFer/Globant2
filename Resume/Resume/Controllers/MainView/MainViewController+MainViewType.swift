import UIKit

extension MainViewController: MainViewType {
    func showErrorView() {
        self.performSegue(withIdentifier: "ErrorSegue", sender: nil)
    }
    
    func showSuccessView() {
        self.performSegue(withIdentifier: "StartSegue", sender: nil)
    }
}
