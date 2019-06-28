
import XCTest
@testable import Resume

class ResumeTests: XCTestCase {
    //MARK: Model Testing
    func testDataSimpleInformation() {
        let information = createFakeResume()
        XCTAssertEqual(information.name, "Heisenberg")
        XCTAssertEqual(information.age, 45)
        XCTAssertEqual(information.summary, "A chemistry honors graduate of the California Institute of Technology")
        XCTAssertEqual(information.employment, "Profesor")
    }
    
    func testDataContactInformation() {
        let information = createFakeResume()
        let contact = information.contact
        
        XCTAssertEqual(contact.phone, "12345678")
        XCTAssertEqual(contact.celphone, "5511335566")
        XCTAssertEqual(contact.email, "heisenberg@gmail.com")
        
    }
    
    func testDataAddresInformation() {
        let information = createFakeResume()
        let address = information.address
        
        XCTAssertEqual(address.zipCode, 12345)
        XCTAssertEqual(address.street, "New Mexico")
        XCTAssertEqual(address.city, "Alabama")
        XCTAssertEqual(address.country, "USA")
    }
    
    func testDataEducationInformation() {
        let information = createFakeResume()
        let education = information.education
        
        XCTAssertEqual(education.universityName, "California Institute of Technology")
        XCTAssertEqual(education.degree, "Chemistry")
        XCTAssertEqual(education.city, "California")
        XCTAssertEqual(education.state, "L.A.")
        XCTAssertEqual(education.startDate, "1990")
        XCTAssertEqual(education.endDate, "1995")
    }
    
    func testDataExperienceInformation() {
        let information = createFakeResume()
        guard let experience = information.experience.first, information.experience.count == 1 else {
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
        let information = createFakeResume()
        guard let skill = information.skills.first, information.skills.count >= 1 else {
            XCTFail("A valid Resume should contain at least 1 skill element")
            return
        }
        
        XCTAssertEqual(skill.skill, "Sells")
        XCTAssertEqual(skill.rating, 3)
    }
    
    func testDataAccomplishmentInformation() {
        let information = createFakeResume()
        guard let accomplishment = information.accomplishments.first, information.accomplishments.count >= 1 else {
            XCTFail("A valid Resume should contain at least 1 accomplishment element")
            return
        }
        
        XCTAssertEqual(accomplishment.title, "DD")
        XCTAssertEqual(accomplishment.description, "Drug Dealer")
    }
    
    func testDataReferenceInformation() {
        let information = createFakeResume()
        guard let references = information.references.first, information.references.count >= 1 else {
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
    
    //MARK: Parse method testing
    func testParseDataFromValidJSON() {
        let client = APIClient()
        var parseData: Resume?
        
        let data = loadFromJSONFile(name: "info")
        
        parseData = client.parseJSON(data: data, model: parseData) ?? parseData
        
        XCTAssertNotNil(parseData)
    }
    
    func testParseDataFromInvalidJSON() {
        let client = APIClient()
        var parseData: Resume?
        
        let data = loadFromJSONFile(name: "failInfo")
        
        parseData = client.parseJSON(data: data, model: parseData) ?? parseData
        
        XCTAssertNil(parseData)
    }
    
    func testParseNilData() {
        let client = APIClient()
        var parseData: Resume?
        
        let data = Data()
        
        parseData = client.parseJSON(data: data, model: parseData) ?? parseData
        
        XCTAssertNil(parseData)
    }
    
    //MARK: APIClient testing
    func testRequestWhitInvalidURL() {
        let client = APIClient()
        guard let fakeURL = URL(string: "https://fakeGitHub.com") else {
            XCTFail("Invalid URL as string")
            return
        }
        let expectation = XCTestExpectation(description: "Request Service")
        
        client.getDataImage(url: fakeURL) { (data, status) in
            if status == .failure {
                expectation.fulfill()
            } else {
                XCTFail("Status request: \(status)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testRequestWhitNOInternetConnection() {
        let client = APIClient()
        let expectation = XCTestExpectation(description: "Request Service")
        
        client.getData() { (data, status) in
            if status == .notConnection {
                XCTFail("You have not internet connection")
                expectation.fulfill()
            } else {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testMainNetworkingFetchesSectionsCorrectly() {
        let client: APIClient
        let session = MockURLSession()
        session.data = loadFromJSONFile(name: "info")
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "info.json"), statusCode: 200, httpVersion: nil, headerFields: nil)
        let expectation = XCTestExpectation(description: "Loading sections correctly")
        
        client = APIClient()
        
        client.getData(session: session) { (data, status) in
            if status == .notConnection {
                XCTFail("You have not internet connection")
                expectation.fulfill()
            } else {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    //MARK: Common methods
    func createFakeResume() -> Resume {
        return Resume(name: "Heisenberg", age: 45, profilePhoto: "", summary: "A chemistry honors graduate of the California Institute of Technology", employment: "Profesor", contact: Contact(phone: "12345678", celphone: "5511335566", email: "heisenberg@gmail.com"), address: Address(zipCode: 12345, street: "New Mexico", city: "Alabama", country: "USA"), education: Education(universityName: "California Institute of Technology", degree: "Chemistry", city: "California", state: "L.A.", startDate: "1990", endDate: "1995"), experience: [Experience(workplace: "AL Car wash", position: "worker", city: "Albuquerque", state: "N.M.", startDate: "2008", endDate: nil, description: "A regular job at a local car wash to supplement his income")], skills: [Skill(skill: "Sells", rating: 3), Skill(skill: "Chemistry", rating: 5)], accomplishments: [Accomplishment(title: "DD", description: "Drug Dealer")], references: [Reference(name: "Saul Goodman", workplace: "Goodman layers", contact: Contact(phone: "567891234", celphone: nil, email: "saulgoodman@gmail.com"))])
    }
    
    func loadFromJSONFile(name: String = "info") -> Data {
        guard let url = Bundle(for: type(of: self)).url(forResource: name, withExtension: "json") else {
            fatalError("\(name).json could not be loaded")
        }
        guard let data  = try? Data(contentsOf: url) else {
            fatalError("Data could not be loaded")
        }
        
        return data
    }
}

