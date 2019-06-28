
import Foundation

extension Array {
    /// Gets an item between the start and end array's indexes
    /// - Parameter index: the index to start the search
    func getItem<T>(at index: Int) -> T? {
        guard index < self.endIndex,
            index >= self.startIndex
            else {
                return nil
        }
        
        return self[index] as? T
    }
}
