
protocol ReferencesModelType {
    var references: [Reference] { get }
}

final class ReferencesModel: ReferencesModelType {
    let references: [Reference]
    
    init(withReferences references: [Reference]) {
        self.references = references
    }
}
