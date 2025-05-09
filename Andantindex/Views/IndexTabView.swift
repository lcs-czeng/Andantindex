//
//  IndexTabView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-03.
//

import SwiftUI

// for tidiness
enum IndexSelection: String, CaseIterable {
    case period = "By Period"
    case name = "By Name"
}

struct IndexTabView: View {
    @EnvironmentObject var viewModel: ComposerViewModel
    @State private var selectedView: IndexSelection = .period
    
    var body: some View {
        VStack {
            
            // picker inspired by SpellingMobile
            Picker("Browse composers", selection: $selectedView) {
                Text("By Period").tag(IndexSelection.period)
                Text("By Name").tag(IndexSelection.name)
            }
            .pickerStyle(.segmented)
            .padding()
            
            // Simple if/else to show the selected view
            if selectedView == .period {
                PeriodListView()
            } else {
                NameListView()
            }
        }
    }
}

#Preview {
    IndexTabView()
        .environmentObject(ComposerViewModel())
}

