import XCTest
@testable import Resume

class SkillsPresenterTestable: XCTestCase {
    func testSkillPresenterCreation() {
        let presenter = SkillsPresenter.init(withModel: MockSkillModel())
        XCTAssertEqual(presenter.skillCount, 1)
    }

    func testGetSuccessfulSkill() {
        let presenter = SkillsPresenter.init(withModel: MockSkillModel())
        XCTAssertEqual(presenter.getSkill(for: IndexPath(row: 0, section: 0))?.rating, 3)
    }

    func testSkillModelCreation() {
        let model = MockSkillModel()
        XCTAssertEqual("skill", model.skills.first?.skill)
    }
}

struct MockSkillModel: SkillsModelType {
    var skills: [Skill] = [Skill.init(skill: "skill", rating: 3)]
}
