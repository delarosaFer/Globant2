import Foundation

class ReferencesPresenter {
    var references: [Reference]?
    
    var referenceCount: Int {
        return references?.count ?? 0
    }
    
    func getReference(for indexPath: IndexPath) -> Reference? {
        guard let references = references,
            indexPath.row < references.endIndex,
            indexPath.row >= references.startIndex else {
                return nil
        }
        
        return references[indexPath.row]
    }
    
}
