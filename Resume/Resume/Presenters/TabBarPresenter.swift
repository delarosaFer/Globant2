import Foundation

final class TabBarPresenter {
    private let model: TabBarModelType
    init(withModel model: TabBarModelType) {
        self.model = model
    }
    
    func makeResumePresenter() -> ResumePresenter {
        return ResumePresenter(withModel: ResumeModel.init(withResume: model.resume))
    }
    
    func makeReferencesPresenter() -> ReferencesPresenter {
        return ReferencesPresenter(withModel: ReferencesModel(withReferences: model.resume.references))
    }
    
    func makeSkillsPresenter() -> SkillsPresenter {
        return SkillsPresenter(withModel: SkillsModel(skills: model.resume.skills))
    }
}

protocol TabBarModelType {
    var resume: Resume { get }
}

final class TabBarModel: TabBarModelType {
    let resume: Resume
    
    init(withResume resume: Resume) {
        self.resume = resume
    }
}
