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
    
    @State private var isAscending = true
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle("Sort A–Z", isOn: $isAscending)
                    .padding()
                
                if viewModel.allComposers.isEmpty {
                    // Show loading spinner if no composers are available yet
                    ProgressView("Loading composers...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.allComposers.sorted { lhs, rhs in
                        isAscending ? lhs.completeName < rhs.completeName : lhs.completeName > rhs.completeName
                    }) { composer in
                        
                        NavigationLink {
                            ComposerDetailView(composer: composer, works: sampleKeyboardWorks)
                        } label: {
                            ComposerListView(composer: composer)
                        }
                    }
                    .listStyle(.grouped)
                }
            }
        }
    }
}

#Preview {
    NameListView()
        .environmentObject(ComposerViewModel())
}

