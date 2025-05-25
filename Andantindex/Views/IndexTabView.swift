//
//  IndexTabView.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-03.
//

import SwiftUI

// MARK: Enum

enum IndexSelection: String, CaseIterable {
    case period = "By Period"
    case name = "By Name"
}

struct IndexTabView: View {
    
    // MARK: Stored Properties
    @EnvironmentObject var viewModel: ComposerViewModel
    @State private var selectedView: IndexSelection = .period
    
    var body: some View {
        NavigationView {
            VStack {
                
                Picker("Browse composers", selection: $selectedView) {
                    Text(IndexSelection.period.rawValue).tag(IndexSelection.period)
                    Text(IndexSelection.name.rawValue).tag(IndexSelection.name)
                }
                .pickerStyle(.segmented)
                .padding()
                
                if selectedView == .period {
                    PeriodListView()
                } else {
                    NameListView()
                }
            }
            .navigationTitle("Composers")
        }
    }
}

#Preview {
    IndexTabView()
        .environmentObject(ComposerViewModel())
}

