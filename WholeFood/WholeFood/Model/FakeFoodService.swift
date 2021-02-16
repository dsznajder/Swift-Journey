//
//  FakeFoodService.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Combine

struct FakeFoodService: FoodService {
    
    func getFood() -> AnyPublisher<[FoodModel], Error> {
        CurrentValueSubject<[FoodModel], Error>([
            FoodModel(id: 1, name: "Asparagus Steak", description: "Stejki", price: 12.21, imageUrl: "asparagus-steak"),
            FoodModel(id: 2, name: "Pitca", description: "Pitca zdrowa", price: 32.48, imageUrl: "healthy-pizza")
        ]).eraseToAnyPublisher()
    }
    
}
