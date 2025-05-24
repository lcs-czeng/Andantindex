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

struct Composer: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let completeName: String
    let birth: String
    let death: String? // made optional to handle null values
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
    Composer(
        id: "1",
        name: "Bach",
        completeName: "Johann Sebastian Bach",
        birth: "1685",
        death: "1750",
        epoch: "Baroque",
        portrait: "https://assets.openopus.org/portraits/12091447-1568084857.jpg"
    ),
    Composer(
        id: "2",
        name: "Beethoven",
        completeName: "Ludwig van Beethoven",
        birth: "1770",
        death: "1827",
        epoch: "Early Romantic",
        portrait: "https://assets.openopus.org/portraits/55910756-1568084860.jpg"
    ),
    Composer(
        id: "3",
        name: "Mozart",
        completeName: "Wolfgang Amadeus Mozart",
        birth: "1756",
        death: "1791",
        epoch: "Classical",
        portrait: "https://assets.openopus.org/portraits/21459195-1568084925.jpg"
    ),
    Composer(
        id: "4",
        name: "Chopin",
        completeName: "Frédéric Chopin",
        birth: "1810",
        death: "1849",
        epoch: "Romantic",
        portrait: "https://assets.openopus.org/portraits/72753742-1568084874.jpg"
    ),
    Composer(
        id: "5",
        name: "Tchaikovsky",
        completeName: "Pyotr Ilyich Tchaikovsky",
        birth: "1840",
        death: "1893",
        epoch: "Romantic",
        portrait: "https://assets.openopus.org/portraits/32941433-1568084956.jpg"
    ),
    Composer(
        id: "6",
        name: "Vivaldi",
        completeName: "Antonio Vivaldi",
        birth: "1678",
        death: "1741",
        epoch: "Baroque",
        portrait: "https://assets.openopus.org/portraits/64540242-1568084959.jpg"
    ),
    Composer(
        id: "7",
        name: "Schubert",
        completeName: "Franz Schubert",
        birth: "1797",
        death: "1828",
        epoch: "Classical",
        portrait: "https://assets.openopus.org/portraits/91122704-1568084944.jpg"
    ),
    Composer(
        id: "8",
        name: "Brahms",
        completeName: "Johannes Brahms",
        birth: "1833",
        death: "1897",
        epoch: "Romantic",
        portrait: "https://assets.openopus.org/portraits/46443632-1568084867.jpg"
    ),
    Composer(
        id: "9",
        name: "Wagner",
        completeName: "Richard Wagner",
        birth: "1813",
        death: "1883",
        epoch: "Romantic",
        portrait: "https://assets.openopus.org/portraits/39267138-1568084959.jpg"
    ),
    Composer(
        id: "10",
        name: "Handel",
        completeName: "George Frideric Handel",
        birth: "1685",
        death: "1759",
        epoch: "Baroque",
        portrait: "https://assets.openopus.org/portraits/59133744-1568084908.jpg"
    )
]


