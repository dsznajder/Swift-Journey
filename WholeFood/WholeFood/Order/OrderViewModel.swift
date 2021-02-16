//
//  OrderViewModel.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation

final class OrderViewModel: ObservableObject {
    
    @Published var items: [FoodViewModel] = [
        FoodViewModel(id: 1, name: "Asparagus Steak", description: "Stejki", price: 12.21, imageUrl: "https://github.com/landrzejewski/best-food-swiftui/blob/main/extras/images/asparagus-steak.png?raw=true"),
        FoodViewModel(id: 2, name: "Pitca", description: "Pitca zdrowa", price: 32.48, imageUrl: "https://github.com/landrzejewski/best-food-swiftui/blob/main/extras/images/healthy-pizza.png?raw=true")
    ]
    
    var totalValue: String { "\(items.reduce(0) { $0 + $1.price }) zł" }
    
    
    func removeItem(with indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
}
