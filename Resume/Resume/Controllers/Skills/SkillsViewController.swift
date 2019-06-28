import UIKit

final class SkillsViewController: UIViewController {
    @IBOutlet weak var skillsTableView: UITableView?
    var presenter: SkillsPresenter? {
        didSet {
            configureTableView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        skillsTableView?.reloadData()
    }

    private func configureTableView() {
        skillsTableView?.dataSource = self
        skillsTableView?.register(UINib.init(nibName: CellNibNames.skills.rawValue, bundle: nil),
                                  forCellReuseIdentifier: CellIdentifier.skills.rawValue)
    }
}
