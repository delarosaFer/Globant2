
import UIKit

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let resumeVC = viewController as? ResumeViewController {
            guard resumeVC.presenter == nil else {
                return
            }
            
            resumeVC.presenter = presenter?.makeResumePresenter()
            return
        }
        
        if let referencesCV = viewController as? ReferencesViewController {
            guard referencesCV.presenter == nil else {
                return
            }
            
            referencesCV.presenter = presenter?.makeReferencesPresenter()
            return
        }
        
        if let skillVC = viewController as? SkillsViewController {
            guard skillVC.presenter == nil else {
                return
            }
            
            skillVC.presenter = presenter?.makeSkillsPresenter()
            return
        }
    }
}
