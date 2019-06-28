
protocol ReferencesModelType {
    var references: [Reference] { get }
}

final public class ReferencesModel: ReferencesModelType {
    public let references: [Reference]
    
    init(withReferences references: [Reference]) {
        self.references = references
    }
}
