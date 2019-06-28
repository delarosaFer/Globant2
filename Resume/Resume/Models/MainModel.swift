
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
