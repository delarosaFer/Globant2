import UIKit

final class MainViewController: UIViewController {
    var presenter: MainViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.setupData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TabBarViewController {
            destination.presenter = presenter?.makeTabBarPresenter()
        } else if let destination = segue.destination as? ErrorViewController {
            destination.presenter = presenter?.makeErrorPresenter()
        }
    }
}
