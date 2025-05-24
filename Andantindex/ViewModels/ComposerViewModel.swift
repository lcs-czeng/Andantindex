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
    
    @Published var favouriteComposers: [Composer] = []
        
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
            
            // 3. Decode the data into a Swift data type
            //
            // Create a decoder object to do most of the work for us
            let decoder = JSONDecoder()
            
            // Use the decoder object to convert the raw data
            // into an instance of our Swift data type
            let decodedData = try decoder.decode(ComposerList.self, from: data)
            
            // If we got here, decoding succeeded,
            // update the published property so UI updates
            self.allComposers = decodedData.composers
            
        } catch {
            
            // Show an error that we wrote and understand
            print("Could not retrieve data from endpoint, or could not decode into an instance of a Swift data type.")
            print("----")
            
            // Show the detailed error to help with debugging
            print(error)
        }
    }
    
    func toggleFavourite(composer: Composer) {
        
        // Check if current composer is in array
        if let index = favouriteComposers.firstIndex(of: composer) {

            // Remove composer
            favouriteComposers.remove(at: index)
        } else {
            
            // Add composer
            favouriteComposers.append(composer)
        }
    }

    func isFavourite(composer: Composer) -> Bool {
        
        // Check if array contain given composer
        favouriteComposers.contains(composer)
        
    }
}
