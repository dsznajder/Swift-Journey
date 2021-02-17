//
//  FoodService.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Combine

protocol FoodService {
    
    func getFood() -> AnyPublisher<[FoodModel], HttpClientError>
    
}
