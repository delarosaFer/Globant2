import Foundation

protocol SkillsModelType {
    var skills: [Skill] { get }
}

final public class SkillsPresenter {
    private let model: SkillsModelType
    public var skillCount: Int {
        return model.skills.count
    }

    required init(withModel model: SkillsModel) {
        self.model = model
    }

    public func getSkill(for indexPath: IndexPath) -> Skill? {
        return model.skills.getItem(at: indexPath.row)
    }
}

final public class SkillsModel: SkillsModelType {
    public let skills: [Skill]
    
    required init(skills: [Skill]) {
        self.skills = skills
    }
}
