//
//  Resume.swift
//  Resume
//
//  Created by Fernando De La Rosa Salas on 6/26/19.
//  Copyright © 2019 Fernando De La Rosa Salas. All rights reserved.
//

import UIKit

// MARK: Resume
struct Resume: Codable {
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
struct Accomplishment: Codable {
    let title: String
    let description: String
}

// MARK: Address
struct Address: Codable {
    let zipCode: Int
    let street: String
    let city: String
    let country: String
}

// MARK: Contact
struct Contact: Codable {
    let phone: String
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
