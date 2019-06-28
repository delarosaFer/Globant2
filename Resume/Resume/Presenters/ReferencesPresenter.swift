import Foundation

protocol ReferencesModelType {
    var references: [Reference] { get }
}

final class ReferencesPresenter {
    private let model: ReferencesModelType
    public var referenceCount: Int {
        return model.references.count
    }
    
    required init(withModel model: ReferencesModelType) {
        self.model = model
    }
    
    func getReference(for indexPath: IndexPath) -> Reference? {
        return model.references.getItem(at: indexPath.row)
    }
}

final public class ReferencesModel: ReferencesModelType {
    public let references: [Reference]
    
    init(withReferences references: [Reference]) {
        self.references = references
    }
}

