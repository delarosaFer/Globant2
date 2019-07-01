import UIKit

protocol NetworkProtocol {
    var dataTask: URLSessionDataTask? {get set}
    func getData(from urlString: String, handler: @escaping (Status) -> Void)
}

final class APIClient: NetworkProtocol {
    // MARK: URL Session
    private let defaultSession: URLSessionProtocol
    internal var dataTask: URLSessionDataTask?

    // MARK: Init Service()
    init(session: URLSessionProtocol = URLSession.shared) {
        self.defaultSession = session
    }

    // MARK: Get data method from url
    /**
     Get the data from gist.github
     
     - parameters:
     - url: A url that contains the data
     - handler: A closure that need be defined by the caller to manipulate the data
     */
    func getData(from urlString: String = Configuration.string(forKey: ConfigurationKeys.infoUrl.rawValue) ?? "", handler: @escaping (Status) -> Void) {
        guard let url = URL(string: urlString) else { return }

        dataTask = defaultSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let response = response as? HTTPURLResponse, AcceptableResponseCode.min.rawValue...AcceptableResponseCode.max.rawValue ~= response.statusCode, let data = data {
                handler(.success(data))
            } else {
                if let error = error {
                    handler(.failure(error))
                } else {
                    handler(.failure(ApiError.UnknownError))
                }
            }
        })
        dataTask?.resume()
    }

    // MARK: Parse JSON to Model method
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
            print(error)
            return nil
        }
    }
}
