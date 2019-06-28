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
