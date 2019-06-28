
import Foundation

final class ReferencesPresenter {
    private let model: ReferencesModelType
    var referenceCount: Int {
        return model.references.count
    }
    
    required init(withModel model: ReferencesModelType) {
        self.model = model
    }
    
    /// Gets a reference given an index path
    func getReference(for indexPath: IndexPath) -> Reference? {
        return model.references.getItem(at: indexPath.row)
    }
}
