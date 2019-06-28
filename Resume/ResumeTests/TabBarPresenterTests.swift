
import XCTest

@testable import Resume

class TabBarPresenterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testPresenterGenerators() {
        let presenter = TabBarPresenter(withModel: MockTabBarModel())
        
        XCTAssertEqual(presenter.makeReferencesPresenter().referenceCount, 1)
        XCTAssertEqual(presenter.makeResumePresenter().experienceCount, 1)
        XCTAssertEqual(presenter.makeSkillsPresenter().skillCount, 2)
    }
    
    func testCreateModel() {
        let model = TabBarModel(withResume: MockTabBarModel().resume)
        XCTAssertEqual(model.resume.name, "Heisenberg")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
}

struct MockTabBarModel: TabBarModelType {
    var resume: Resume = Resume(name: "Heisenberg", age: 45, profilePhoto: "", summary: "A chemistry honors graduate of the California Institute of Technology", employment: "Profesor", contact: Contact(phone: "12345678", celphone: "5511335566", email: "heisenberg@gmail.com"), address: Address(zipCode: 12345, street: "New Mexico", city: "Alabama", country: "USA"), education: Education(universityName: "California Institute of Technology", degree: "Chemistry", city: "California", state: "L.A.", startDate: "1990", endDate: "1995"), experience: [Experience(workplace: "AL Car wash", position: "worker", city: "Albuquerque", state: "N.M.", startDate: "2008", endDate: nil, description: "A regular job at a local car wash to supplement his income")], skills: [Skill(skill: "Sells", rating: 3), Skill(skill: "Chemistry", rating: 5)], accomplishments: [Accomplishment(title: "DD", description: "Drug Dealer")], references: [Reference(name: "Saul Goodman", workplace: "Goodman layers", contact: Contact(phone: "567891234", celphone: nil, email: "saulgoodman@gmail.com"))])
}
