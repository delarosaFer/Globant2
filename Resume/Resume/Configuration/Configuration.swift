//
//  Configuration.swift
//  Resume
//
//  Created by Fernando De La Rosa Salas on 6/27/19.
//

import Foundation

enum Configuration {
    static func string(forKey key: String) -> String? {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
}
