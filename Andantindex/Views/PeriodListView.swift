//
//  PeriodListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-03.
//

import SwiftUI

struct PeriodListView: View {
    
    // sharing data through the environment
    @EnvironmentObject var viewModel: ComposerViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.allComposers.isEmpty {
                    // Show loading spinner if no composers are available yet
                    ProgressView("Loading composers...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List {
                        
                        // iterate over the keys (periods)
                        ForEach(viewModel.composersByPeriod.keys.sorted(), id:\.self) { key in
                            
                            Section {
                                // get the composers for this period
                                let composers = viewModel.composersByPeriod[key]!
                                
                                // iterate over the composers
                                
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
}

#Preview {
    PeriodListView()
        .environmentObject(ComposerViewModel())
}
