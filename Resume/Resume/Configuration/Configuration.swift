import Foundation

enum Configuration {
    static func string(forKey key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)
    }
}
