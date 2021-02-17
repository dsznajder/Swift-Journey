//
//  OrderModel.swift
//  WholeFood
//
//  Created by Damian Sznajder on 17/02/2021.
//

import Foundation

final class OrderModel: ObservableObject {
    
    @Published var entries:[OrderEntryModel] = []
    
    func addEntry(_ entry: OrderEntryModel) {
        entries.append(entry)
    }
    
    func removeEntry(indexSet: IndexSet){
        entries.remove(atOffsets: indexSet)
    }
    
}
