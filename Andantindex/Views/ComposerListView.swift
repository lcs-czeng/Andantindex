//
//  ListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import SwiftUI

struct ComposerListView: View {
    let composer: Composer
    
    var body: some View {
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
}
