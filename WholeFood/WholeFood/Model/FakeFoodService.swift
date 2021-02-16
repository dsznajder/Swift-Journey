//
//  FakeFoodService.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Combine

struct FakeFoodService: FoodService {
    
    func getFood() -> AnyPublisher<[FoodModel], Error> {
        Just([
            FoodModel(id: 1, name: "Asparagus Steak", description: "Stejki", price: 12.21, imageUrl: "https://github.com/landrzejewski/best-food-swiftui/blob/main/extras/images/asparagus-steak.png?raw=true"),
            FoodModel(id: 2, name: "Pitca", description: "Pitca zdrowa", price: 32.48, imageUrl: "https://github.com/landrzejewski/best-food-swiftui/blob/main/extras/images/healthy-pizza.png?raw=true")
        ])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }
    
}
