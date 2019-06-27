import Foundation

protocol ResumeViewType: class {
    func refreshData()
    func showGeneralDataWith(name: String, employment: String, summary: String)
    func setImageWithData(data: Data)
}

final public class ResumePresenter {
    private var model: ResumeModelType
    private var client = APIClient()

    var education: Education { return model.resume.education }
    var experienceCount: Int { return model.resume.experience.count }
    var profileUrl: String { return model.resume.profilePhoto }
    var educationTitle: String { return self.model.educationSection }
    var experienceTitle: String { return self.model.experienceSection }
    
    weak var delegate: ResumeViewType?
    
    deinit {
        delegate = nil
    }
    
    required init (withModel model: ResumeModelType) {
        self.model = model
    }
    
    func getJob(at index: Int) -> Experience? {
        return self.model.resume.experience.getItem(at: index)
    }
    
    func makeContactPresenter() -> ContactPresenter {
        return  ContactPresenter(withModel: ContactModel(withContact: model.resume.contact))
    }
    
    func getSections() -> Int {
        return model.sections.count
    }
    
    func getSectionTitle(at section: Int) -> String {
        return model.sections.getItem(at: section) ?? ""
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
        guard let url = URL(string: urlStr) else { return }
        
        client.getData(url: url) { (data, status) in
            if status == .success {
                guard let data = data else { return }
                completition(data)
            }
        }
    }
}

protocol ResumeModelType {
    var resume: Resume { get }
    var sections: [String] { get set }
    var educationSection: String { get }
    var experienceSection: String { get }
    var rowsPerSection: [Int] { get set }
}

final class ResumeModel: ResumeModelType {
    var resume: Resume
    var sections = [String]()
    var educationSection = String()
    var experienceSection = String()
    var rowsPerSection = [0, 0]
    
    init(withResume resume: Resume) {
        self.resume = resume
        
        educationSection = NSLocalizedString("educationTitle", comment: "Education title")
        experienceSection = NSLocalizedString("experienceTitle", comment: "Experience title")
        sections = [educationSection, experienceSection]
    }    
}
