
import UIKit

protocol NetworkProtocol {
    var dataTask: URLSessionDataTask? {get set}
    func getData(from urlString: String, handler: @escaping (Status) -> Void)
}

final class APIClient: NetworkProtocol {
    //MARK: URL of the resume
//    private let resumeURL: URL?
    
    //MARK: URL Session
    private let defaultSession: URLSession
    internal var dataTask: URLSessionDataTask?
    
    //MARK: Init Service()
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        configuration.urlCache = nil
        defaultSession = URLSession(configuration: configuration)
    }
    
    //MARK: Get data method from url
    /**
     Get the data from gist.github
     
     - parameters:
     - url: A url that contains the data
     - handler: A closure that need be defined by the caller to manipulate the data
     */
    func getData(from urlString: String = Configuration.string(forKey: "INFO_URL") ?? "", handler: @escaping (Status) -> Void) {
        guard let url = URL(string: urlString) else { return }
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, 200...209 ~= response.statusCode, let data = data {
                handler(.success(data))
            } else {
                if let error = error {
                    handler(.failure(error))
                }
            }
        })
        dataTask?.resume()
    }
    
    //MARK: Parse JSON to Model method
    /**
     Make the parse from the data to an any model
     
     - returns:
     - Model: A struct that implents Codable protocol
     
     - parameters:
     - data: A date that was got by the API
     - model: A struct that implents Codable protocol
     */
    func parseJSON<Model: Codable>(data: Data, model: Model) -> Model? {
        let jsonDecoder = JSONDecoder()
        do {
            let json = try jsonDecoder.decode(Model.self, from: data)
            return json
        } catch {
            return nil
        }
    }
}
