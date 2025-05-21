//
//  WorkListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-02.
//

import SwiftUI

struct WorkListView: View {
    
    // MARK: Stored Properties
    let workVM: WorkViewModel
    
    // MARK: Body
    var body: some View {
        List {
            // Iterate over the genre keys
            ForEach(workVM.workByGenre.keys.sorted(), id: \.self) { key in
                
                Section {
                    // Get the works for this genre
                    let works = workVM.workByGenre[key]!
                    
                    // Iterate over the works
                    ForEach(works) { work in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(work.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            if !work.subtitle.isEmpty {
                                Text(work.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                } header: {
                    Text(key)
                }
            }
        }
        .listStyle(.grouped)
    }
}


#Preview {
    WorkListView(workVM: WorkViewModel(composer: 91))
}
