//
//  ListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import SwiftUI

struct ComposerListView: View {
    // temporary, before injecting viewmodel to environment
    @ObservedObject var viewModel: ComposerViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.allComposers.isEmpty {
                    // Show loading spinner if no composers are available yet
                    ProgressView("Loading composers...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.allComposers) { composer in
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
                                Text(composer.epoch)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(PlainListStyle())
                }
            }
        }
    }
}

#Preview {
    ComposerListView(viewModel: ComposerViewModel())
}
