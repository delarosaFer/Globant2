//
//  Configuration.swift
//  Resume
//
//  Created by Fernando De La Rosa Salas on 6/27/19.
//

import Foundation

enum Configuration {
    static func value<T>(for key: String) -> T {
        guard let value = Bundle.main.infoDictionary?[key] as? T else {
            fatalError(NSLocalizedString("fatalErrorInvvalidKey", comment: "Invalid or missing Info.plist key: \(key)"))
        }
        return value
    }
}
