//
//  URLSession+ext.swift
//  WholeFood
//
//  Created by Damian Sznajder on 17/02/2021.
//

import Foundation
import Combine

enum HttpClientError: Error {
    case invalidUrl
    case requestFailed
}


extension URLSession {
    func request<Response: Decodable>(forUrl urlString: String, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response, HttpClientError> {
            url(urlString: urlString)
            .flatMap {
                URLSession.shared.dataTaskPublisher(for: $0)
                    .map { $0.data }
                    .decode(type: Response.self, decoder: decoder)
                    .mapError { error in
                        HttpClientError.requestFailed
                    }
                    .receive(on: DispatchQueue.main)
            }
            .eraseToAnyPublisher()
    }
    
//    func request<Body: Codable>(
//        forUrl urlString: String,
//        body: Body,
//        encoder: JSONEncoder = JSONEncoder(),
//        decoder: JSONDecoder = JSONDecoder()
//    ) -> AnyPublisher<Body, HttpClientError> {
//        url(urlString: urlString)
//            .map {
//                let request = URLRequest(url: $0)
//                request.httpMethod = "POST"
//            }
//    }
    
    private func url(urlString: String) -> AnyPublisher<URL, HttpClientError> {
        Just(urlString)
            .tryMap { urlString -> URL in
                if let url = URL(string: urlString) {
                    return url
                } else {
                    throw HttpClientError.invalidUrl
                }
            }
            .mapError { _ in HttpClientError.requestFailed }
            .eraseToAnyPublisher()
    }
}

