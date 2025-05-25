//
//  NameListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-03.
//

import SwiftUI

struct NameListView: View {
    
    // MARK: Stored Properties
    @EnvironmentObject var viewModel: ComposerViewModel
    @State private var isAscending = true
    @State private var searchText = ""
    
    // MARK: Computed Properties
    private var filteredComposers: [Composer] {
        let filtered = viewModel.allComposers.filter { composer in
            searchText.isEmpty || composer.completeName.localizedCaseInsensitiveContains(searchText)
        }
        return filtered.sorted { lhs, rhs in
            isAscending ? lhs.completeName < rhs.completeName : lhs.completeName > rhs.completeName
        }
    }
    
    var body: some View {
        VStack {
            
            // Sorting order toggle
            Toggle("Sort A–Z", isOn: $isAscending)
                .padding()
            
            if viewModel.allComposers.isEmpty {
                
                // Loading State
                ProgressView("Loading composers...")
                    .progressViewStyle(CircularProgressViewStyle())
                
            } else {
                
                // Composer list sorted by name
                List(filteredComposers) { composer in
                    
                    NavigationLink {
                        ComposerDetailView(composer: composer, works: sampleKeyboardWorks)
                    } label: {
                        ComposerListView(composer: composer)
                    }
                }
                .listStyle(.grouped)
            }
        }
        .searchable(text: $searchText, prompt: "Search composers")    }
}

#Preview {
    NameListView()
        .environmentObject(ComposerViewModel())
}

