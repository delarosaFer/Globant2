
protocol ErrorModelType {
    var errorMessage: String { get }
}

final class ErrorViewModel: ErrorModelType {
    let errorMessage: String
    
    init(error: String) {
        self.errorMessage = error
    }
}
