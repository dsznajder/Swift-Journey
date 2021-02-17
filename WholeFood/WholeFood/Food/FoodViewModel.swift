//
//  FoodViewModel.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation

struct FoodViewModel: Identifiable {
    
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageUrl: String
    
    var priceText: String {
        "\(price) zł"
    }
    
    var orderEntry: OrderEntryModel {
        OrderEntryModel(id: id, name: name, price: price)
    }
}
