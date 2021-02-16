//
//  HackerNewsApp.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

@main
struct HackerNewsApp: App {
    var body: some Scene {
        WindowGroup {
            HackerNewsView(viewModel: HackerNewsViewModel(hackerNewsService: HttpHackerNewsService()))
        }
    }
}
