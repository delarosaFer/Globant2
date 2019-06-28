import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let storyboard = UIStoryboard(name: StoryBoardNameIdentifier.main.rawValue, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: StoryBoardIdentifier.mainView.rawValue) as? MainViewController
        initialViewController?.presenter = MainViewPresenter()

        self.window?.rootViewController = initialViewController
        self.window?.makeKeyAndVisible()

        return true
    }
}
