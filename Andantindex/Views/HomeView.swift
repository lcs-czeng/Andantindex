//
//  ContentView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: Stored Properties
    
    @EnvironmentObject var viewModel: ComposerViewModel

    var body: some View {
        TabView {
            IndexTabView()
                .tabItem {
                    Image(systemName: "list.bullet.rectangle")
                    Text("Index")
                }

            FavouriteComposerView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favourites")
                }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ComposerViewModel())
}
