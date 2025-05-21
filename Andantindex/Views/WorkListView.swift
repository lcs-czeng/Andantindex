//
//  WorkListView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-02.
//

import SwiftUI

struct WorkListView: View {
    
    let workVM: WorkViewModel
    
    var body: some View {
        List(workVM.works) { work in
            VStack(alignment: .leading, spacing: 6) {
                Text(work.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                
                if !work.subtitle.isEmpty {
                    Text(work.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Text(work.genre)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .padding(.top, 2)
            }
            .padding(.vertical, 8)
        }
        .listStyle(.plain)

    }
}



#Preview {
    WorkListView(workVM: WorkViewModel(composer: 91))
}
