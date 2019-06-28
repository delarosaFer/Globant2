
import Foundation
@testable import Resume

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        defer { completionHandler(data, response, error) }
        return DataTaskMock(completionHandler: completionHandler)
    }
}
