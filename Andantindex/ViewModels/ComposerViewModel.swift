//
//  ComposerViewModel.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import Foundation

@Observable
class ComposerViewModel {
    
    // Stored Properties
    
    var allComposers: [Composer] = []
    var filteredComposers: [Composer] = []

    // Fetch composers from the API
    func fetchComposers() {
        Task {
            await fetchData()
        }
    }
    
    // Perform the actual data fetching from the API
    func fetchData() async {
        // API endpoint for fetching composers
        let endpoint = "https://api.openopus.org/composer/list/rec.json"
        
        // Ensure the URL is valid
        guard let url = URL(string: endpoint) else {
            print("Invalid URL.")
            return
        }

        do {
            // Fetch the data from the URL asynchronously
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode the data into the ComposerList model
            let decoded = try JSONDecoder().decode(ComposerList.self, from: data)
            
            // Update the properties on the main thread
            self.allComposers = decoded.composers
            self.filteredComposers = decoded.composers // Initially, display all composers
        } catch {
            // Handle errors such as network failure or decoding issues
            print("Failed to fetch or decode composer data: \(error)")
        }
    }
}
