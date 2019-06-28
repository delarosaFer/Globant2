import XCTest
@testable import Resume

class MainViewPresenterTest: XCTestCase {
    func testPresenterIntegrity() {
        let presenter = MainViewPresenter()
        presenter.setResume(MockMainModel().resume!)

        XCTAssertEqual(presenter.makeErrorPresenter()?.errorMessage, "")
        XCTAssertEqual(presenter.makeTabBarPresenter()?.makeSkillsPresenter().skillCount, 2)
    }

    func testErrorViewOnPresenterDelegate() {
        let presenter = MainViewPresenter()
        let mainDelegate = MockMainDelegate()

        presenter.delegate = mainDelegate
        presenter.delegate?.showErrorView()

        XCTAssertEqual("failure", mainDelegate.response)
    }

    func testSuccessViewOnPresenterDelegate() {
        let presenter = MainViewPresenter()
        let mainDelegate = MockMainDelegate()

        presenter.delegate = mainDelegate
        presenter.delegate?.showSuccessView()

        XCTAssertEqual("success", mainDelegate.response)
    }

    func testModelCreation() {
        let modal = MainViewModel()
        modal.resume = MockMainModel().resume

        XCTAssertEqual(modal.resume?.name, "Heisenberg")
    }
}

struct MockMainModel: MainModelType {
    var errorMessage: String = "mock"
    var client: APIClient = APIClient()
    var resume: Resume? = Resume(name: "Heisenberg", age: 45, profilePhoto: "", summary: "A chemistry honors graduate of the California Institute of Technology", employment: "Profesor", contact: Contact(phone: "12345678", celphone: "5511335566", email: "heisenberg@gmail.com"), address: Address(zipCode: 12345, street: "New Mexico", city: "Alabama", country: "USA"), education: Education(universityName: "California Institute of Technology", degree: "Chemistry", city: "California", state: "L.A.", startDate: "1990", endDate: "1995"), experience: [Experience(workplace: "AL Car wash", position: "worker", city: "Albuquerque", state: "N.M.", startDate: "2008", endDate: nil, description: "A regular job at a local car wash to supplement his income")], skills: [Skill(skill: "Sells", rating: 3), Skill(skill: "Chemistry", rating: 5)], accomplishments: [Accomplishment(title: "DD", description: "Drug Dealer")], references: [Reference(name: "Saul Goodman", workplace: "Goodman layers", contact: Contact(phone: "567891234", celphone: nil, email: "saulgoodman@gmail.com"))])
}

class MockMainDelegate: MainViewType {
    var response = ""

    func showErrorView() {
        response = "failure"
    }

    func showSuccessView() {
        response = "success"
    }
}
