
import UIKit

final public class APIClient {
    
    /**
     Singleton of Service class useful for interact with the API
     */
    public static let shared = APIClient()
    
    //MARK: URL base
    private let URLBase: URL?
    
    //MARK: URL Session
    private let defaultSession: URLSession
    private var dataTask: URLSessionDataTask?
    
    //MARK: Init Service()
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringCacheData
        configuration.urlCache = nil
        defaultSession = URLSession(configuration: configuration)
        
        guard let urlStr = Bundle.main.object(forInfoDictionaryKey: "InfoURL") as? String else {
            self.URLBase = URL(string: "")
            return
        }
        self.URLBase = URL(string: urlStr)
    }
    
    //MARK: Get data method from a base url
    /**
     Get the data from gist.github
     
     - parameters:
     - handler: A closure that need be defined by the caller to manipulate the data
     */
    public func getData(handler: @escaping (Data?, Status) -> Void) {
        if let url = URLBase {
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                if let response = response as? HTTPURLResponse, 200...209 ~= response.statusCode  {
                    if let data = data {
                        handler(data, .success)
                    }else {
                        handler(Data(), .success)
                    }
                } else {
                    if let error = error {
                        debugPrint(error.localizedDescription)
                        if error.localizedDescription == "The Internet connection appears to be offline." {
                            handler(nil, .notConnection)
                        }else {
                            handler(nil, .failure)
                        }
                    }
                }
            }
            dataTask?.resume()
        }else {
            debugPrint(NSLocalizedString("errorURL", comment: "URL corrupt"))
        }
    }
    
    //MARK: Get data
    /**
     Get the data from a specific url
     
     - parameters:
     - url: A url that contains the data
     - handler: A closure that need be defined by the caller to manipulate the data
     */
    public func getData(url: URL, handler: @escaping (Data?, Status) -> Void) {
        dataTask = defaultSession.dataTask(with: url) { data, response, error in
            if let response = response as? HTTPURLResponse, 200...209 ~= response.statusCode  {
                if let data = data {
                    handler(data, .success)
                }else {
                    handler(Data(), .success)
                }
            } else {
                if let error = error {
                    debugPrint(error.localizedDescription)
                    if error.localizedDescription == "The Internet connection appears to be offline." {
                        handler(nil, .notConnection)
                    }else {
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
    public func parseJSON<Model: Codable>(data: Data, model: Model) -> Model? {
        let jsonDecoder = JSONDecoder()
        do {
            let json = try jsonDecoder.decode(Model.self, from: data)
            return json
        } catch {
            debugPrint(error)
            return nil
        }
    }
}
