//
//  FoodListViewModel.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

final class FoodListViewModel: ObservableObject {
    
    private let foodService: FoodService
    private var subscriptions = Set<AnyCancellable>()
    
    @Published var food: [FoodModel] = []
    
    init(foodService: FoodService = FakeFoodService()) {
        self.foodService = foodService
    }
    
    func refresh() {
        foodService.getFood()
            .sink(receiveCompletion: onError) {
                self.food = $0
            }
            .store(in: &subscriptions)
    }
    
    private func onError(_ complition: Subscribers.Completion<Error>) {
        if case .failure(let error) = complition {
            print(error)
        }
    }
}
