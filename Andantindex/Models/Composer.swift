//
//  Composer.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import Foundation

// MARK: Composer Model

struct ComposerList: Codable {
    let composers: [Composer]
}

struct Composer: Codable, Identifiable {
    let id: String
    let name: String
    let completeName: String
    let birth: String
    let death: String
    let epoch: String
    let portrait: String
    
    // Correctly map JSON keys to Swift property names

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case completeName = "complete_name"
        case birth
        case death
        case epoch
        case portrait
    }
}
