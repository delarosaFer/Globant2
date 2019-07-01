import UIKit

/// A cell containing the Job Expererience cell
class ExperienceCell: UITableViewCell {
    /// workplace's name information
    @IBOutlet weak var workplace: UILabel?
    /// the position held
    @IBOutlet weak var position: UILabel?
    /// a brief description of the activities
    @IBOutlet weak var descriptionWork: UILabel?
    /// the state of the label
    @IBOutlet weak var state: UILabel?
    /// the city of the workplace
    @IBOutlet weak var city: UILabel?
    /// the start year
    @IBOutlet weak var startDate: UILabel?
    /// the end year
    @IBOutlet weak var endDate: UILabel?

    /// Configures the cell with a job experience
    /// - Parameter experience: The experience information
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
        endDate.text = experience.endDate ?? NSLocalizedString(LocalizedStringIdentifier.currentDate.rawValue,
                                                               comment: LocalizedStringIdentifier.currentDate.rawValue)
    }
}
