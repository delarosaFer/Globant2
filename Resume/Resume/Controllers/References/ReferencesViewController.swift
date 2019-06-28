
import UIKit

final class ReferencesViewController: UIViewController {
    @IBOutlet weak var referencesTableView: UITableView?
    var presenter: ReferencesPresenter? {
        didSet {
            configureTableView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        referencesTableView?.reloadData()
    }
    
    func configureTableView() {
        referencesTableView?.dataSource = self
        referencesTableView?.register(UINib.init(nibName: CellNibNames.references.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifier.references.rawValue)
    }
}

