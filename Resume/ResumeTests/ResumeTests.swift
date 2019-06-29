import XCTest
@testable import Resume

class ResumeTests: XCTestCase, JSONTest {
    // MARK: Model Testing
    func testDataSimpleInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        
        XCTAssertEqual(test.information.name, "Heisenberg")
        XCTAssertEqual(test.information.age, 45)
        XCTAssertEqual(test.information.summary, "A chemistry honors graduate of the California Institute of Technology")
        XCTAssertEqual(test.information.employment, "Profesor")
    }

    func testDataContactInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        let contact = test.information.contact

        XCTAssertEqual(contact.phone, "12345678")
        XCTAssertEqual(contact.celphone, "5511335566")
        XCTAssertEqual(contact.email, "heisenberg@gmail.com")

    }

    func testDataAddresInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        let address = test.information.address

        XCTAssertEqual(address.zipCode, 12345)
        XCTAssertEqual(address.street, "New Mexico")
        XCTAssertEqual(address.city, "Alabama")
        XCTAssertEqual(address.country, "USA")
    }

    func testDataEducationInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        let education = test.information.education

        XCTAssertEqual(education.universityName, "California Institute of Technology")
        XCTAssertEqual(education.degree, "Chemistry")
        XCTAssertEqual(education.city, "California")
        XCTAssertEqual(education.state, "L.A.")
        XCTAssertEqual(education.startDate, "1990")
        XCTAssertEqual(education.endDate, "1995")
    }

    func testDataExperienceInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        guard let experience = test.information.experience.first, test.information.experience.count == 1 else {
            XCTFail("A valid Resume should contain at least 1 experience element")
            return
        }

        XCTAssertEqual(experience.workplace, "AL Car wash")
        XCTAssertEqual(experience.position, "worker")
        XCTAssertEqual(experience.description, "A regular job at a local car wash to supplement his income")
        XCTAssertEqual(experience.city, "Albuquerque")
        XCTAssertEqual(experience.state, "N.M.")
        XCTAssertEqual(experience.startDate, "2008")
        XCTAssertEqual(experience.endDate, nil)
    }

    func testDataSkillInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        guard let skill = test.information.skills.first, test.information.skills.count >= 1 else {
            XCTFail("A valid Resume should contain at least 1 skill element")
            return
        }

        XCTAssertEqual(skill.skill, "Sells")
        XCTAssertEqual(skill.rating, 3)
    }

    func testDataAccomplishmentInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        guard let accomplishment = test.information.accomplishments.first, test.information.accomplishments.count >= 1 else {
            XCTFail("A valid Resume should contain at least 1 accomplishment element")
            return
        }

        XCTAssertEqual(accomplishment.title, "DD")
        XCTAssertEqual(accomplishment.description, "Drug Dealer")
    }

    func testDataReferenceInformation() {
        let model = createFakeResume()
        let test = ModelTest(model: model)
        guard let references = test.information.references.first, test.information.references.count >= 1 else {
            XCTFail("A valid Resume should contain at least 1 reference element")
            return
        }
        let referenceContact = references.contact

        XCTAssertEqual(references.name, "Saul Goodman")
        XCTAssertEqual(references.workplace, "Goodman layers")
        XCTAssertEqual(referenceContact.phone, "567891234")
        XCTAssertEqual(referenceContact.celphone, nil)
        XCTAssertEqual(referenceContact.email, "saulgoodman@gmail.com")
    }

    // MARK: Common method
    func createFakeResume() -> Resume {
        return Resume(name: "Heisenberg", age: 45, profilePhoto: "", summary: "A chemistry honors graduate of the California Institute of Technology", employment: "Profesor", contact: Contact(phone: "12345678", celphone: "5511335566", email: "heisenberg@gmail.com"), address: Address(zipCode: 12345, street: "New Mexico", city: "Alabama", country: "USA"), education: Education(universityName: "California Institute of Technology", degree: "Chemistry", city: "California", state: "L.A.", startDate: "1990", endDate: "1995"), experience: [Experience(workplace: "AL Car wash", position: "worker", city: "Albuquerque", state: "N.M.", startDate: "2008", endDate: nil, description: "A regular job at a local car wash to supplement his income")], skills: [Skill(skill: "Sells", rating: 3), Skill(skill: "Chemistry", rating: 5)], accomplishments: [Accomplishment(title: "DD", description: "Drug Dealer")], references: [Reference(name: "Saul Goodman", workplace: "Goodman layers", contact: Contact(phone: "567891234", celphone: nil, email: "saulgoodman@gmail.com"))])
    }
}
