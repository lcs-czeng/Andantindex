//
//  NameListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-03.
//

import SwiftUI

struct NameListView: View {
    
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
                }
            }
        }
    }
}

#Preview {
    NameListView()
        .environmentObject(ComposerViewModel())
}

