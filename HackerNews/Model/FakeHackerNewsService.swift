//
//  FakeHackerNewsService.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

struct FakeHackerNewsService: HackerNewsService {
   
    func getArticles() -> AnyPublisher<[Article], Error> {
        CurrentValueSubject<[Article], Error>([Article(id: 1, title: "SwiftUI", by: "Jan Kowalski", time: 0, url: "http://jankowalski.pl")])
            .eraseToAnyPublisher()
    }
    
    
}
