//
//  WorkListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-02.
//

import SwiftUI

struct WorkListView: View {
    let works: [Work]
    
    var body: some View {
        List(works) { work in
            VStack(alignment: .leading) {
                Text(work.title)
                    .font(.headline)
                if !work.subtitle.isEmpty {
                    Text(work.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Text("Genre: \(work.genre)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Works")
    }
}


#Preview {
    WorkListView(works: sampleKeyboardWorks)
}
