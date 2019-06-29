import Foundation

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
    var rowsPerSection = [Int]()

    init(withResume resume: Resume) {
        self.resume = resume

        educationSection = NSLocalizedString("educationTitle", comment: "Education title")
        experienceSection = NSLocalizedString("experienceTitle", comment: "Experience title")
        sections = [educationSection, experienceSection]
    }
}
