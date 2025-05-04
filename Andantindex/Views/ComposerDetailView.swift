//
//  ComposerDetailView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-02.
//

import SwiftUI

struct ComposerDetailView: View {
    let composer: Composer
    let works: [Work]
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: composer.portrait)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 300, height: 300)
            
            Text(composer.completeName)
                .font(.title)
                .bold()
            
            Text("\(composer.birth) – \(composer.death)")
                .font(.title3)
            
            Text("Epoch: \(composer.epoch)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Works")
                .font(.title3)
            
            WorkListView(works: sampleKeyboardWorks)
            
            Spacer()
        }
        .padding()
        .navigationTitle(composer.name)
    }
}

// accessing mock data array
#Preview {
    ComposerDetailView(composer: sampleComposers[0], works: sampleKeyboardWorks)
}
