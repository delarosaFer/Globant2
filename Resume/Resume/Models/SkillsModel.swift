
protocol SkillsModelType {
    var skills: [Skill] { get }
}

final public class SkillsModel: SkillsModelType {
    public let skills: [Skill]
    
    required init(skills: [Skill]) {
        self.skills = skills
    }
}
