//
//  ListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import SwiftUI

struct ComposerListView: View {
    
    // MARK: Stored Property
    let composer: Composer
    
    var body: some View {
        HStack {
            
            // Composer portrait
            AsyncImage(url: URL(string: composer.portrait)) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            // Composer name and dates
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
