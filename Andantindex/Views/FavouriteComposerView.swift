//
//  FavouriteView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import SwiftUI

struct FavouriteComposerView: View {
    
    // MARK: Stored Properties
    @EnvironmentObject var composerVM: ComposerViewModel
    
    var body: some View {
        NavigationView {
            List {
                // Favourite Composers List
                ForEach(composerVM.favouriteComposers) { composer in
                    NavigationLink(destination: ComposerDetailView(composer: composer, works: [])) {
                        HStack {
                            AsyncImage(url: URL(string: composer.portrait)) { image in
                                image.resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(composer.completeName)
                                    .font(.headline)
                                
                                Text("\(composer.birth) – \(composer.death ?? "Unknown")")
                                    .font(.subheadline)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    
                }
                // Enable Swipe-to-Delete and Persist Changes
                .onDelete { offsets in
                    composerVM.favouriteComposers.remove(atOffsets: offsets)
                    composerVM.persistFavouriteComposers()
                }
            }
            .navigationTitle("Favourites")
            .toolbar {
                EditButton()
            }
        }
    }
}
