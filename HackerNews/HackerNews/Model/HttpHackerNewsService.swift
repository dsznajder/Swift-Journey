//
//  HttpHackerNewsService.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

struct HttpHackerNewsService: HackerNewsService {
    
    private let decoder: JSONDecoder
    private let apiQueue: DispatchQueue
    
    private enum Endpoint {
        private static let baseUrl = URL(string: "https://hacker-news.firebaseio.com/v0/")!
        
        case articles
        case article(Int)
        
        var url: URL {
            switch self {
            case .articles:
                return Endpoint.baseUrl.appendingPathComponent("newstories.json")
                
            case .article(let id):
                return Endpoint.baseUrl.appendingPathComponent("item/\(id).json")
            }
        }
    }
    
    init(decoder: JSONDecoder = JSONDecoder(), apiQueue: DispatchQueue = DispatchQueue(label: "api-queue", qos: .default, attributes: .concurrent)) {
        self.decoder = decoder
        self.apiQueue = apiQueue
    }
    
    func getArticles() -> AnyPublisher<[Article], Error> {
        URLSession.shared
            .dataTaskPublisher(for: Endpoint.articles.url)
            .map { $0.data }
            .decode(type: [Int].self, decoder: decoder)
            .filter { !$0.isEmpty }
            .flatMap { getArticles(ids: $0) }
            .scan([]) { $0 + [$1] }
            .map { $0.sorted() }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func getArticles(ids: [Int], limit: Int = 20) -> AnyPublisher<Article, Error> {
        let articlesIds = Array(ids.prefix(limit))
        let firstArticle = getArticle(id: articlesIds[0])
        
        return Array(articlesIds.dropFirst())
            .reduce(firstArticle) { result, id in
                result
                    .merge(with: getArticle(id: id))
                    .eraseToAnyPublisher()
            }
    }
    
    private func getArticle(id: Int) -> AnyPublisher<Article, Error> {
        URLSession.shared
            .dataTaskPublisher(for: Endpoint.article(id).url)
            .receive(on: apiQueue)
            .map { $0.data }
            .decode(type: Article.self, decoder: decoder)
            .catch { _ in Empty<Article, Error>() }
            .eraseToAnyPublisher()
    }
    
}
