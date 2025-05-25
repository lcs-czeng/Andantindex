//
//  ComposerDetailView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-02.
//

import SwiftUI

struct ComposerDetailView: View {
    
    // MARK: Stored Properties
    @EnvironmentObject var composerVM: ComposerViewModel
    let composer: Composer
    let works: [Work]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    // Composer portrait
                    AsyncImage(url: URL(string: composer.portrait)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 300, height: 300)
                    
                    HStack {
                        
                        // Favourite Toggle
                        Button(action: {
                            composerVM.toggleFavourite(composer: composer)
                        }) {
                            Image(systemName: composerVM.isFavourite(composer: composer) ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(composerVM.isFavourite(composer: composer) ? .yellow : .gray)
                        }
                        
                        // Composer info
                        Text(composer.completeName)
                            .font(.title)
                            .bold()
                        
                    }
                    Text("\(composer.birth) – \(composer.death ?? "Unknown")")
                        .font(.title3)
                    
                    // Composer epoch
                    Text("Epoch: \(composer.epoch)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("Works")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    // Works list
                    WorkListView(workVM: WorkViewModel(composer: Int(composer.id) ?? 0))
                        .frame(height: 300)
                        .background(Color(.black))
                        .cornerRadius(12)
                        .shadow(radius: 3)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ComposerDetailView(composer: sampleComposers[0], works: sampleKeyboardWorks)
        .environmentObject(ComposerViewModel())
}
