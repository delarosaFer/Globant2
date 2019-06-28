
import XCTest

class ResumeUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    //MARK: Element exist testing
    func testBasicInfoElementsExist() {
        let app = XCUIApplication()
        
        let porfilePicture = app.images["porfileImage"]
        let name = app.staticTexts["nameLabel"]
        let employment = app.staticTexts["employmentLabel"]
        let summary = app.staticTexts["summaryLabel"]
        
        XCTAssert(name.exists)
        XCTAssert(employment.exists)
        XCTAssert(porfilePicture.exists)
        XCTAssert(summary.exists)
    }
    
    func testContactButtonElement() {
        let app = XCUIApplication()
        
        let contactButton = app.buttons["contactButton"]
        
        XCTAssert(contactButton.exists)
    }
    
    func testEducationSectionElements() {
        let app = XCUIApplication()
        
        let educationSection = app/*@START_MENU_TOKEN@*/.staticTexts["Education"]/*[[".otherElements[\"Education\"].staticTexts[\"Education\"]",".staticTexts[\"Education\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let cell = app.tables.children(matching: .cell).element(boundBy: 0)
        let universityNameLabel = cell.staticTexts["universityLabel"]
        let degreeLabel = cell.staticTexts["degreeLabel"]
        let cityLabel = cell.staticTexts["cityLabel"]
        let stateLabel = cell.staticTexts["stateLabel"]
        let startDate = cell.staticTexts["startDateLabel"]
        let endDate = cell.staticTexts["endDateLabel"]
        
        XCTAssert(educationSection.exists)
        XCTAssert(universityNameLabel.exists)
        XCTAssert(degreeLabel.exists)
        XCTAssert(cityLabel.exists)
        XCTAssert(stateLabel.exists)
        XCTAssert(startDate.exists)
        XCTAssert(endDate.exists)
    }
    
    func testExperienceSectionElements() {
        let app = XCUIApplication()
        
        let experienceSection = app.staticTexts["Experience"]
        let cell = app.tables.children(matching: .cell).element(boundBy: 1)
        let workplaceLabel = cell.staticTexts["workplaceLabel"]
        let positionLabel = cell.staticTexts["positionLabel"]
        let descriptionLabel = cell.staticTexts["descriptionLabel"]
        let cityLabel = cell.staticTexts["cityLabel"]
        let stateLabel = cell.staticTexts["stateLabel"]
        let startDate = cell.staticTexts["startDateLabel"]
        let endDate = cell.staticTexts["endDateLabel"]
        
        XCTAssert(experienceSection.exists)
        XCTAssert(workplaceLabel.exists)
        XCTAssert(positionLabel.exists)
        XCTAssert(descriptionLabel.exists)
        XCTAssert(cityLabel.exists)
        XCTAssert(stateLabel.exists)
        XCTAssert(startDate.exists)
        XCTAssert(endDate.exists)
    }
    
    func testReferenceElementsExists() {
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["References"].tap()
        let cell = app.tables.children(matching: .cell).element(boundBy: 0)
        let titleReference = app.staticTexts["referencesTitle"]
        let name = cell.staticTexts["referenceNameLabel"]
        let workplace = cell.staticTexts["referenceWorkplaceLabel"]
        let email = cell.staticTexts["emailLabel"]
        let phone = cell.staticTexts["phoneLabel"]
        let cellPhone = cell.staticTexts["cellPhoneLabel"]
        
        XCTAssert(titleReference.exists)
        XCTAssert(name.exists)
        XCTAssert(workplace.exists)
        XCTAssert(email.exists)
        XCTAssert(phone.exists)
        XCTAssert(cellPhone.exists)
    }
    
    func testSkillsElementsExists() {
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Skills"].tap()
        let cell = app.tables.children(matching: .cell).element(boundBy: 0)
        let titleSkill = app.staticTexts["skillTitle"]
        let skill = cell.staticTexts["skillLabel"]
        
        XCTAssert(titleSkill.exists)
        XCTAssert(skill.exists)
    }
    
    //MARK: Test funtionality
    func testTabBarButton() {
        let tabBarsQuery = XCUIApplication().tabBars
        tabBarsQuery.buttons["References"].tap()
        tabBarsQuery.buttons["Skills"].tap()
        tabBarsQuery.buttons["Resume"].tap()
    }
    
    func testContact() {
        let app = XCUIApplication()
        app.buttons["contactButton"].tap()
        app.buttons["Return"].tap()
    }
}
