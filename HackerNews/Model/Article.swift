//
//  Article.swift
//  HackerNews
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation

struct Article: Decodable, Identifiable, Comparable {
    
    let id: Int
    let title: String
    let by: String
    let time: TimeInterval
    let url: String
    
    static func < (lhs: Article, rhs: Article) -> Bool {
        lhs.time > rhs.time
    }
    
}
