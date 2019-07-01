import Foundation

extension ApiError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .UnknownError:
            return  NSLocalizedString("errorRequest", comment: "unknown error")
        }
    }
}
