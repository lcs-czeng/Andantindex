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
                                    HStack {
                                        // load image from internet using the portrait URL
                                        AsyncImage(url: URL(string: composer.portrait)) { image in
                                            image.resizable()
                                            // show gray when image is loading
                                        } placeholder: {
                                            Color.gray
                                        }
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                        
                                        VStack(alignment: .leading) {
                                            Text(composer.completeName)
                                                .font(.headline)
                                            // Display "Unknown" if death is nil
                                            Text("\(composer.birth) – \(composer.death ?? "Unknown")")
                                                .font(.subheadline)
                                        }
                                    }
                                    .padding(.vertical, 4)
                                }
                                
                            } header: {
                                Text(key)
                            }

                            
                        }
                    }
                    .listStyle(.grouped)
                    .navigationTitle("Composers")
                }
            }
        }
    }
}
