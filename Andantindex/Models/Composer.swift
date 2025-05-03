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


// mock data for composers
let sampleComposers: [Composer] = [
    Composer(id: "1", name: "Bach", completeName: "Johann Sebastian Bach", birth: "1685", death: "1750", epoch: "Baroque", portrait: "https://assets.openopus.org/portraits/12091447-1568084857.jpg"),
    Composer(id: "2", name: "Beethoven", completeName: "Ludwig van Beethoven", birth: "1770", death: "1827", epoch: "Early Romantic", portrait: "https://assets.openopus.org/portraits/55910756-1568084860.jpg"),
    Composer(id: "3", name: "Mozart", completeName: "Wolfgang Amadeus Mozart", birth: "1756", death: "1791", epoch: "Classical", portrait: "https://assets.openopus.org/portraits/21459195-1568084925.jpg")
]

