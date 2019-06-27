import UIKit

final class ReferencesViewController: UIViewController {
    @IBOutlet weak var referencesTableView: UITableView?
    var presenter: ReferencesPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = ReferencesPresenter()
        presenter?.references = (self.parent as? TabBarViewController)?.resume?.references
        configureTableView()
        referencesTableView?.reloadData()
    }
    
    func configureTableView() {
        referencesTableView?.dataSource = self
        referencesTableView?.register(UINib.init(nibName: "ReferencesTableViewCell", bundle: nil), forCellReuseIdentifier: "references")
    }
}

