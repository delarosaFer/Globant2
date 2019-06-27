
import UIKit

class ExperienceCell: UITableViewCell {

    
    @IBOutlet weak var workplace: UILabel?
    @IBOutlet weak var position: UILabel?
    @IBOutlet weak var descriptionWork: UILabel?
    @IBOutlet weak var state: UILabel?
    @IBOutlet weak var startDate: UILabel?
    @IBOutlet weak var city: UILabel?
    @IBOutlet weak var endDate: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWith(experience: Experience) {
        guard let workplace = workplace,
            let position = position,
            let descriptionWork = descriptionWork,
            let state = state,
            let city = city,
            let startDate = startDate,
            let endDate = endDate else {
                return
        }
        
        workplace.text = experience.workplace
        position.text = experience.position
        descriptionWork.text = experience.description
        state.text = experience.state
        city.text = experience.city
        startDate.text = experience.startDate
        endDate.text = experience.endDate ?? NSLocalizedString("currentDate", comment: "Current job")
        
    }
}
