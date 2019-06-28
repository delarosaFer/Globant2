protocol SkillsModelType {
    var skills: [Skill] { get }
}

final class SkillsModel: SkillsModelType {
    let skills: [Skill]

    required init(skills: [Skill]) {
        self.skills = skills
    }
}
