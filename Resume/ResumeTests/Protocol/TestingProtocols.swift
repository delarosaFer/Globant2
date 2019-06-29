import XCTest
@testable import Resume

protocol JSONTest {
    func loadFromJSONFile(name: String) -> Data
}

protocol ModelTesting {
    var information: Resume {get set}
}

extension JSONTest where Self: XCTestCase {
    func loadFromJSONFile(name: String = "info") -> Data {
        guard let url = Bundle(for: type(of: self)).url(forResource: name, withExtension: "json") else {
            fatalError(NSLocalizedString("fatalErrorJson", comment: "\(name).json could not be loaded"))
        }
        guard let data  = try? Data(contentsOf: url) else {
            fatalError(NSLocalizedString("fatalErrorData", comment: "Data could not be loaded"))
        }
        
        return data
    }
}
