//
//  FoodModel.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation

struct FoodModel: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageUrl: String
    
}
