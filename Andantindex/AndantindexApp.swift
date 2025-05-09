//
//  AndantindexApp.swift
//  Andantindex
//
//  Created by 曾梓恒 on 2025-05-01.
//

import SwiftUI

@main
struct AndantindexApp: App {
    @StateObject private var viewModel = ComposerViewModel()

    var body: some Scene {
        WindowGroup {
            ComposerListView(viewModel: viewModel)
                .onAppear {
                    viewModel.fetchComposers()
                }
        }
    }
}

