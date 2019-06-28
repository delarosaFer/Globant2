
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
        let client = APIClient()
        
        self.model?.client.getData(handler: { (data, status) in
            if status == .success {
                guard let data = data else { return }
                response = client.parseJSON(data: data, model: response) ?? response
                completition(response)
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.model?.errorMessage = NSLocalizedString("errorRequest", comment: "Parsing was wrong")
                    self?.delegate?.showErrorView()
                }
            }
        })
    }
    
    func setResume(_ resume: Resume) {
        self.model?.resume = resume
    }
    
    func setupData() {
        request { [weak self] (resume) in
            if let resume = resume {
                DispatchQueue.main.async { [weak self] in
                    self?.setResume(resume)
                    self?.delegate?.showSuccessView()
                }
                
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.model?.errorMessage = NSLocalizedString("errorParse", comment: "Parsing was wrong")
                }
            }
        }
    }
 }
