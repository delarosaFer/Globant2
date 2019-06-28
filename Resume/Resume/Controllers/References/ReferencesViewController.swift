
import UIKit

final class ReferencesViewController: UIViewController {
    @IBOutlet weak var referencesTableView: UITableView?
    var presenter: ReferencesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        referencesTableView?.reloadData()
    }
    
    func configureTableView() {
        referencesTableView?.dataSource = self
        referencesTableView?.register(UINib.init(nibName: CellNibNames.references.rawValue, bundle: nil), forCellReuseIdentifier: CellIdentifier.references.rawValue)
    }
}

