import UIKit

final class ResumeViewController: UIViewController {
    @IBOutlet weak var profilePhoto: UIImageView?
    @IBOutlet weak var name: UILabel?
    @IBOutlet weak var employment: UILabel?
    @IBOutlet weak var summary: UILabel?
    @IBOutlet weak var infoTableView: UITableView?
    @IBOutlet weak var contactButton: UIButton?
    var presenter: ResumePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter?.delegate = self
        registerCells()
        setupView()
        presenter?.reloadInfo()
    }

    // MARK: Register cells
    private func registerCells() {
        let educationNib = UINib.init(nibName: CellNibNames.education.rawValue, bundle: nil)
        infoTableView?.register(educationNib, forCellReuseIdentifier: CellIdentifier.education.rawValue)
        let experienceNib = UINib.init(nibName: CellNibNames.experience.rawValue, bundle: nil)
        infoTableView?.register(experienceNib, forCellReuseIdentifier: CellIdentifier.experience.rawValue)
    }

    private func setupView() {
        contactButton?.layer.cornerRadius = 9
        profilePhoto?.rounded()
    }

    @IBAction func tapContactButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: StoryBoardSegue.contactSegue.rawValue, sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ContactViewController {
            destination.presenter = presenter?.makeContactPresenter()
        }
    }
}
