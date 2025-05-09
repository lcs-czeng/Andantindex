//
//  Work.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-02.
//

import Foundation

struct Work: Codable, Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let genre: String
    
}

// mock data for works
let sampleOrchestralWorks: [Work] = [
    Work(id: "9411", title: "Brandenburg Concerto no. 1 in F major, BWV.1046", subtitle: "", genre: "Orchestral"),
    Work(id: "9664", title: "Brandenburg Concerto no. 2 in F major, BWV.1047", subtitle: "", genre: "Orchestral"),
    Work(id: "9688", title: "Brandenburg Concerto no. 3 in G major, BWV.1048", subtitle: "", genre: "Orchestral"),
    Work(id: "9373", title: "Brandenburg Concerto no. 4 in G major, BWV.1049", subtitle: "", genre: "Orchestral"),
    Work(id: "10116", title: "Brandenburg Concerto no. 5 in D major, BWV.1050", subtitle: "", genre: "Orchestral")
]

let sampleKeyboardWorks: [Work] = [
    Work(id: "10172", title: "Italian Concerto, BWV.971", subtitle: "", genre: "Keyboard"),
    Work(id: "9172", title: "Passacaglia and Fugue in C minor, BWV.582", subtitle: "", genre: "Keyboard"),
    Work(id: "10242", title: "Toccata, Adagio and Fugue in C major, BWV.564", subtitle: "", genre: "Keyboard"),
    Work(id: "28101", title: "Toccata and fugue in D minor, BWV.565", subtitle: "", genre: "Keyboard"),
    Work(id: "9781", title: "Well-tempered Clavier, Book 1, BWV.846-869", subtitle: "", genre: "Keyboard"),
    Work(id: "9318", title: "Well-tempered Clavier, Book 2, BWV.870-893", subtitle: "", genre: "Keyboard"),
    Work(id: "9101", title: "2-Part Inventions, BWV.772-786", subtitle: "", genre: "Keyboard")
]
