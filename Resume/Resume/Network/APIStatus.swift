import UIKit

// MARK: Status possible cases
/// Represents the status result of a petition
public enum Status {
    case success(Data)
    case failure(Error)
}
