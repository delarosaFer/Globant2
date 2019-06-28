
import UIKit

final class SkillsViewController: UIViewController {
    @IBOutlet weak var skillsTableView: UITableView?
    var presenter: SkillsPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        skillsTableView?.reloadData()
    }
    
    func configureTableView() {
        skillsTableView?.dataSource = self
        skillsTableView?.register(UINib.init(nibName: CellNibNames.skills.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifier.skills.rawValue)
    }
}
