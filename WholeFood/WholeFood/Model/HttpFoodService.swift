//
//  HttpFoodService.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

struct HttpFoodService: FoodService {
    
    private let decoder: JSONDecoder
    private let apiQueue: DispatchQueue
    private static let foodDataUrl = URL(string: "https://raw.githubusercontent.com/landrzejewski/best-food-swiftui/main/extras/data.json")!
    
    init(decoder: JSONDecoder = JSONDecoder(), apiQueue: DispatchQueue = DispatchQueue(label: "api-queue", qos: .default, attributes: .concurrent)) {
        self.decoder = decoder
        self.apiQueue = apiQueue
    }
    
    func getFood() -> AnyPublisher<[FoodModel], Error> {
        URLSession.shared
            .dataTaskPublisher(for: HttpFoodService.foodDataUrl)
            .map { $0.data }
            .decode(type: [FoodModel].self, decoder: decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
