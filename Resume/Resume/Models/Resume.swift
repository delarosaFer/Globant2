import UIKit

// MARK: Resume
struct Resume: Codable {
    let name: String
    let age: Int
    let profilePhoto: String
    let summary: String
    let employment: String
    let contact: Contact
    let education: Education
    let experience: [Experience]
    let skills: [Skill]
    let references: [Reference]
}

// MARK: Contact
struct Contact: Codable {
    let phone: String?
    let celphone: String?
    let email: String
}

// MARK: Education
struct Education: Codable {
    let universityName: String
    let degree: String
    let city: String
    let state: String
    let startDate: String
    let endDate: String?
}

// MARK: Experience
struct Experience: Codable {
    let workplace: String
    let position: String
    let city: String
    let state: String
    let startDate: String
    let endDate: String?
    let description: String
}

// MARK: Reference
struct Reference: Codable {
    let name: String
    let workplace: String
    let contact: Contact
}

// MARK: Skill
struct Skill: Codable {
    let skill: String
    let rating: Int
}
