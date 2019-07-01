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

/// An enum represeting
enum LocalizedStringIdentifier: String {
    case references = "referencesTitle"
    case education = "educationTitle"
    case experience = "experienceTitle"
    case contactButton = "contactButton"
    case requestError = "errorRequest"
    case parseError = "ErrorParse"
    case currentDate = "- Current"
    case noPhone = "nilPhone"
    case phoneLabel = "phoneLabel"
    case cellPhoneLabel = "cellPhoneLabel"
    case emailLabel = "emailLabel"
    case errorData = "fatalErrorData"
    case errorJson = "fatalErrorJson"
    case noConnectionMessage = "notConnectionMessage"
}
