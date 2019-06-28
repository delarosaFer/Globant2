import UIKit

/// A class representing education information
final class EducationCell: UITableViewCell {
    /// The name of the university
    @IBOutlet weak var universityName: UILabel?
    /// The degree obtained
    @IBOutlet weak var degree: UILabel?
    /// The state of the university
    @IBOutlet weak var state: UILabel?
    /// the city of the university
    @IBOutlet weak var city: UILabel?
    /// The carrer start year
    @IBOutlet weak var startDate: UILabel?
    /// The carrer end year
    @IBOutlet weak var endDate: UILabel?

    /// The university's school information
    func configureWith(education: Education) {
        guard let universityName = universityName,
            let degree = degree,
            let state = state,
            let city = city,
            let startDate = startDate,
            let endDate = endDate else {
                return
        }

        universityName.text = education.universityName
        degree.text = education.degree
        state.text = education.state
        city.text = education.city
        startDate.text = education.startDate
        endDate.text = education.endDate ?? NSLocalizedString("currentDate", comment: "Unfinished education")
    }
}
