//
//  HackerNewsViewModel.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

final class HackerNewsViewModel: ObservableObject {
    
    private let hackerNewsService: HackerNewsService
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var articles: [Article] = []
    
    init(hackerNewsService: HackerNewsService = FakeHackerNewsService()) {
        self.hackerNewsService = hackerNewsService
        refresh()
    }
    
    func refresh() {
        hackerNewsService.getArticles()
            .sink(receiveCompletion: { complition in
                if case .failure(let error) = complition {
                    print(error)
                }
            }) { self.articles = $0 }
            .store(in: &subscriptions)
    }
}
