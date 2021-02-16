//
//  HackerNewsService.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

protocol HackerNewsService {
    
    func getArticles() -> AnyPublisher<[Article], Error>

}
