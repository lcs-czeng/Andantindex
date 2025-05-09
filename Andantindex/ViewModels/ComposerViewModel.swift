//
//  ComposerViewModel.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import Foundation

@MainActor
class ComposerViewModel: ObservableObject {
    
    // MARK: Stored properties
    @Published var allComposers: [Composer] = []
    @Published var filteredComposers: [Composer] = []

    // MARK: Computed properties
    
    var composersByPeriod: [String: [Composer]] {
        
        return Dictionary(grouping: allComposers) { currentComposer in
            
            currentComposer.epoch
            
        }
        
    }
    
    // MARK: Initializers
    
    init() {
        fetchComposers()
    }

    // MARK: Functions
    
    func fetchComposers() {
        Task {
            await fetchData()
        }
    }
    
    func fetchData() async {
        
        // 1. Attempt to create a URL from the address provided
        let endpoint = "https://api.openopus.org/composer/list/rec.json"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }
        
        // 2. Fetch the raw data from the URL
        //
        // Network requests can potentially fail (throw errors) so
        // we complete them within a do-catch block to report errors
        // if they occur.
        //
        do {
            
            // Fetch the data
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Print the received data in the debug console
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
            
            let decoded = try JSONDecoder().decode(ComposerList.self, from: data)
            
            self.allComposers = decoded.composers
            self.filteredComposers = decoded.composers // Initially, display all composers
        } catch {
            // Handle errors such as network failure or decoding issues
            print("Failed to fetch or decode composer data: \(error)")
        }
    }
}
