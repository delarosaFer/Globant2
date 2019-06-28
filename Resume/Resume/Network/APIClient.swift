
import UIKit

protocol NetworkProtocol {
    var dataTask: URLSessionDataTask? {get set}
    func getData(session: URLSessionProtocol, handler: @escaping (Data?, Status) -> Void)
    func getDataImage(url: URL, handler: @escaping (Data?, Status) -> Void)
}

final class APIClient: NetworkProtocol {
    //MARK: URL of the resume
    private let resumeURL: URL?
    
    //MARK: URL Session
    private let defaultSession: URLSession
    internal var dataTask: URLSessionDataTask?
    
    //MARK: Init Service()
    init(urlStr: String = Configuration.string(forKey: "INFO_URL") ?? "") {
        guard let url = URL(string: urlStr) else {
            fatalError(NSLocalizedString("errorURL", comment: "Error URL"))
        }
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        configuration.urlCache = nil
        defaultSession = URLSession(configuration: configuration)
        self.resumeURL = url
    }
    
    //MARK: Get data method from a base url
    /**
     Get the data from gist.github
     
     - parameters:
     - handler: A closure that need be defined by the caller to manipulate the data
     */
    func getData(session: URLSessionProtocol = URLSession.shared, handler: @escaping (Data?, Status) -> Void) {
        if let url = resumeURL {
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                if let response = response as? HTTPURLResponse, 200...209 ~= response.statusCode  {
                    if let data = data {
                        handler(data, .success)
                    } else {
                        handler(Data(), .success)
                    }
                } else {
                    if let error = error {
                        debugPrint(error.localizedDescription)
                        if error.localizedDescription == "The Internet connection appears to be offline." {
                            handler(nil, .notConnection)
                        } else {
                            handler(nil, .failure)
                        }
                    }
                }
            }
            dataTask?.resume()
        }
    }
    
    //MARK: Get data
    /**
     Get the data from a specific url
     
     - parameters:
     - url: A url that contains the data
     - handler: A closure that need be defined by the caller to manipulate the data
     */
    func getDataImage(url: URL, handler: @escaping (Data?, Status) -> Void) {
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse, 200...209 ~= response.statusCode  {
                if let data = data {
                    handler(data, .success)
                } else {
                    handler(Data(), .success)
                }
            } else {
                if let error = error {
                    debugPrint(error.localizedDescription)
                    if error.localizedDescription == "The Internet connection appears to be offline." {
                        handler(nil, .notConnection)
                    } else {
                        handler(nil, .failure)
                    }
                }
            }
        }
        
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
