import Foundation
 
 protocol MainViewType: class {
    func showErrorView()
    func showSuccessView()
 }

 final class MainViewPresenter {
    private var model: MainModelType?
    weak var delegate: MainViewType?
    
    deinit {
        delegate = nil
    }
    
    init() {
        self.model = MainViewModel()
    }
    
    func makeErrorPresenter() -> ErrorViewPresenter? {
        guard let model = self.model else {
            return nil
        }
        return ErrorViewPresenter(withModel: ErrorViewModel(error: model.errorMessage))
    }
    
    func makeTabBarPresenter() -> TabBarPresenter? {
        guard let resume = model?.resume else {
            return nil
        }
        
        return TabBarPresenter(withModel: TabBarModel(withResume: resume))
    }
    
    func request(completition: @escaping ((Resume?) -> Void)) {
        var response: Resume?
        
        self.model?.client.getData(handler: { (data, status) in
            if status == .success {
                guard let data = data else { return }
                response = APIClient.shared.parseJSON(data: data, model: response) ?? response
                completition(response)
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.model?.errorMessage = NSLocalizedString("errorRequest", comment: "Parsing was wrong")
                    self?.delegate?.showErrorView()
                }
            }
        })
    }
    
    func setupData() {
        request { [weak self] (resume) in
            if let resume = resume {
                DispatchQueue.main.async { [weak self] in
                    self?.model?.resume = resume
                    self?.delegate?.showSuccessView()
                }
                
            }else {
                DispatchQueue.main.async { [weak self] in
                    self?.model?.errorMessage = NSLocalizedString("errorParse", comment: "Parsing was wrong")
                }
            }
        }
    }
 }

protocol MainModelType {
    var errorMessage: String { get set }
    var client: APIClient { get }
    var resume: Resume? { get set }
}

final class MainViewModel: MainModelType {
    var errorMessage: String = ""
    var client = APIClient()
    var resume: Resume?
 }