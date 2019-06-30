import Foundation

final class ErrorViewPresenter {
    private let model: ErrorModelType

    var errorMessage: String {
        return model.errorMessage
    }

    init(withModel model: ErrorModelType) {
        self.model = model
    }
}
