import XCTest
@testable import Resume

class APIClientTest: XCTestCase, JSONTest {
    // MARK: APIClient testing
    func testRequestWhitInvalidURL() {
        let client = APIClient()
        let fakeURL = ConstantURL.fakeURL.rawValue
        let expectation = XCTestExpectation(description: "Request Service")
        
        client.getData(from: fakeURL) { (status) in
            switch status {
            case .failure( _):
                expectation.fulfill()
            case .success( _):
                XCTFail("Status request: \(status)")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testRequestWhitNOInternetConnection() {
        let client = APIClient()
        let expectation = XCTestExpectation(description: "Request Service")
        
        client.getData() { (status) in
            switch status {
            case .failure(let error):
                if error.localizedDescription == NSLocalizedString("notConnectionMessage", comment: "Not internet connection") {
                    XCTFail("Status request: \(status), \(error)")
                    expectation.fulfill()
                } else {
                    XCTFail("Status request: \(status), \(error)")
                    expectation.fulfill()
                }
            case .success( _):
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testNetworkingSectionSuccess() {
        let client: APIClient
        let session = MockURLSession()
        session.data = loadFromJSONFile(name: "info")
        session.response = HTTPURLResponse(url: URL(fileURLWithPath: "info.json"), statusCode: 200, httpVersion: nil, headerFields: nil)
        let expectation = XCTestExpectation(description: "Loading sections correctly")
        
        client = APIClient(session: session)
        
        client.getData { (status) in
            switch status {
            case .success( _):
                expectation.fulfill()
            case .failure( _):
                XCTFail(NSLocalizedString("notConnectionMessage", comment: "Not connnection"))
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    // MARK: Parse method testing
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
}
