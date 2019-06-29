import Foundation

protocol ResumeViewType: class {
    func refreshData()
    func showGeneralDataWith(name: String, employment: String, summary: String)
    func setImageWithData(data: Data)
}

final class ResumePresenter {
    private var model: ResumeModelType
    private var client = APIClient()
    
    weak var delegate: ResumeViewType?
    
    var experienceCount: Int {
        return model.resume.experience.count
    }
    var profileUrl: String {
        return model.resume.profilePhoto
    }
    var educationTitle: String {
        return self.model.educationSection
    }
    var experienceTitle: String {
        return self.model.experienceSection
    }

    required init (withModel model: ResumeModelType) {
        self.model = model
    }

    deinit {
        delegate = nil
    }
    
    func getEducation() -> Education? {
        return model.resume.education
    }
    
    func getJob(at index: Int) -> Experience? {
        return self.model.resume.experience[index]
    }

    func makeContactPresenter() -> ContactPresenter {
        return  ContactPresenter(withModel: ContactModel(withContact: model.resume.contact))
    }

    func getSections() -> Int {
        return model.sections.count
    }

    func getSectionTitle(at section: Int) -> String {
        return model.sections[section]
    }

    func getRowsPerSection(at index: Int) -> Int {
        return model.rowsPerSection[index]
    }

    func reloadInfo() {
        self.delegate?.showGeneralDataWith(name: model.resume.name,
                                           employment: model.resume.employment,
                                           summary: model.resume.summary)

        model.rowsPerSection.removeAll()
        model.rowsPerSection.append(1)
        model.rowsPerSection.append(experienceCount)

        requestImage(urlStr: self.profileUrl) { [weak self] (data) in
            DispatchQueue.main.async { [weak self] in
                self?.delegate?.setImageWithData(data: data)
            }
        }

        self.delegate?.refreshData()
    }

    func requestImage(urlStr: String, completition: @escaping ((Data) -> Void)) {
        client.getData(from: urlStr) { (status) in
            switch status {
            case .success(let data):
                completition(data)
            case .failure( _):
                return
            }
        }
    }
}
