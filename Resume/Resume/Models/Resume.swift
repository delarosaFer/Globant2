
import UIKit

// MARK: Resume
public struct Resume: Codable {
    let name: String
    let age: Int
    let profilePhoto: String
    let summary: String
    let employment: String
    let contact: Contact
    let address: Address
    let education: Education
    let experience: [Experience]
    let skills: [Skill]
    let accomplishments: [Accomplishment]
    let references: [Reference]
}

// MARK: Accomplishment
public struct Accomplishment: Codable {
    let title: String
    let description: String
}

// MARK: Address
public struct Address: Codable {
    let zipCode: Int
    let street: String
    let city: String
    let country: String
}

// MARK: Contact
public struct Contact: Codable {
    let phone: String
    let celphone: String?
    let email: String
}

// MARK: Education
public struct Education: Codable {
    let universityName: String
    let degree: String
    let city: String
    let state: String
    let startDate: String
    let endDate: String?
}

// MARK: Experience
public struct Experience: Codable {
    let workplace: String
    let position: String
    let city: String
    let state: String
    let startDate: String
    let endDate: String?
    let description: String
}

// MARK: Reference
public struct Reference: Codable {
    let name: String
    let workplace: String
    let contact: Contact
}

// MARK: Skill
public struct Skill: Codable {
    let skill: String
    let rating: Int
}
