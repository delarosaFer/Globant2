
import Foundation

final class SkillsPresenter {
    private let model: SkillsModelType
    var skillCount: Int {
        return model.skills.count
    }

    required init(withModel model: SkillsModelType) {
        self.model = model
    }

    func getSkill(for indexPath: IndexPath) -> Skill? {
        return model.skills.getItem(at: indexPath.row)
    }
}

