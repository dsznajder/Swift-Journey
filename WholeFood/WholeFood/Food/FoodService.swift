//
//  FoodService.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

protocol FoodService {
    
    func getFood() -> AnyPublisher<[FoodViewModel], Error>

}
