
import Foundation

final public class SkillsPresenter {
    private let model: SkillsModelType
    public var skillCount: Int {
        return model.skills.count
    }

    required init(withModel model: SkillsModelType) {
        self.model = model
    }

    public func getSkill(for indexPath: IndexPath) -> Skill? {
        return model.skills.getItem(at: indexPath.row)
    }
}

