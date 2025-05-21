//
//  WorkViewModel.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-21.
//

import Foundation

@Observable @MainActor
class WorkViewModel: Observable {
    
    // MARK: Stored Properties
    
    var works: [Work] = []
    
    // MARK: Computed Properties
    
    var workByGenre: [String: [Work]] {
        
        return Dictionary(grouping: works) { currentWork in
            
            currentWork.genre
            
        }
        
    }
    
    // MARK: Initializer
    
    init(composer: Int) {
        Task {
            self.fetchWorks(for: composer)
        }
    }
    
    // MARK: Functions
    
    func fetchWorks(for composerID: Int) {
        Task {
            await fetchData(for: composerID)
        }
    }
    
    func fetchData(for composerID: Int) async {
        
        // 1. Attempt to create a URL from the address provided
        let endpoint = "https://api.openopus.org/work/list/composer/\(composerID)/genre/all.json"
        guard let url = URL(string: endpoint) else {
            print("Invalid address for JSON endpoint.")
            return
        }
        
        do {
            // 2. Fetch the data
            let (data, _) = try await URLSession.shared.data(from: url)
            
            print("Got data from endpoint, contents of response are:")
            print(String(data: data, encoding: .utf8)!)
            
            // 3. Decode the data into a Swift data type
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(WorkResponse.self, from: data)
            
            self.works = decodedData.works
            
        } catch {
            print("Could not retrieve or decode works data.")
            print("----")
            print(error)
        }
    }
}
