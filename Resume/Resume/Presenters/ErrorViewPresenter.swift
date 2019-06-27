import Foundation

final public class ErrorViewPresenter {
    private let model: ErrorModelType
    var errorMessage: String {
        return model.errorMessage
    }
    
    init(withModel model: ErrorModelType) {
        self.model = model
    }
}

protocol ErrorModelType {
    var errorMessage: String { get }
}

final public class ErrorViewModel: ErrorModelType {
    let errorMessage: String
    
    init(error: String) {
        self.errorMessage = error
    }
}
