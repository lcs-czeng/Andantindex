//
//  PeriodListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-03.
//

import SwiftUI

struct PeriodListView: View {
    
    // MARK: Stored Properties
    @EnvironmentObject var viewModel: ComposerViewModel
    
    var body: some View {
        VStack {
            if viewModel.allComposers.isEmpty {
                
                // Loading view
                ProgressView("Loading composers...")
                    .progressViewStyle(CircularProgressViewStyle())
                
            } else {
                
                // Composer list grouped by period
                List {
                    ForEach(viewModel.composersByPeriod.keys.sorted(), id: \.self) { key in
                        
                        Section {
                            let composers = viewModel.composersByPeriod[key]!
                            
                            ForEach(composers) { composer in
                                NavigationLink {
                                    ComposerDetailView(composer: composer, works: sampleKeyboardWorks)
                                } label: {
                                    ComposerListView(composer: composer)
                                }
                            }
                        } header: {
                            Text(key)
                        }
                    }
                }
                .listStyle(.grouped)
            }
        }
    }
}

#Preview {
    PeriodListView()
        .environmentObject(ComposerViewModel())
}
