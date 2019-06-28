
import UIKit

extension MainViewController: MainViewType {
    func showErrorView() {
        self.performSegue(withIdentifier: StoryBoardSegue.errorSegue.rawValue, sender: nil)
    }
    
    func showSuccessView() {
        self.performSegue(withIdentifier: StoryBoardSegue.successfulSegue.rawValue, sender: nil)
    }
}
