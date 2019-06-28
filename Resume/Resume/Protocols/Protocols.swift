import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }

protocol NetworkingService {
    var endpoint: String { get set }
    func fetchData(using session: URLSessionProtocol, completion: @escaping (_ response: Status) -> Void)
}
