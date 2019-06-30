/// An enum that reflects the minimum and maximun amount of skill levels
enum SkillLevel: Int {
    case min = 1
    case max = 5
}

/// An enum representing the configuration keys
enum ConfigurationKeys: String {
    case infoUrl = "INFO_URL"
}

/// An enum representing acceptable HTTP Responses
enum AcceptableResponseCode: Int {
    case min = 200
    case max = 209
}
