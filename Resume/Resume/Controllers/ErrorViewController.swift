import UIKit

final class ErrorViewController: UIViewController {
    @IBOutlet weak var errorView: UIView?
    @IBOutlet weak var errorMessage: UILabel?
    @IBOutlet weak var refreshButton: UIButton?
    var presenter: ErrorViewPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        errorView?.layer.borderColor = UIColor.darkColor.cgColor
        errorView?.layer.borderWidth = 1
        errorMessage?.text = presenter?.errorMessage
        refreshButton?.layer.cornerRadius = 9
    }

    @IBAction func tapRefresh(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
