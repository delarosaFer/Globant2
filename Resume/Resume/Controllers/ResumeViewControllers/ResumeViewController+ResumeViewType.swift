import UIKit

extension ResumeViewController: ResumeViewType {
    func setImageWithData(data: Data) {
        self.profilePhoto?.image = UIImage(data: data)
    }

    func showGeneralDataWith(name: String, employment: String, summary: String) {
        guard let nameLabel = self.name,
            let employmentLabel = self.employment,
            let summaryLabel = self.summary else {
                return
        }

        nameLabel.text = name
        employmentLabel.text = employment
        summaryLabel.text = summary
    }

    func refreshData() {
        self.infoTableView?.reloadData()
    }
}
