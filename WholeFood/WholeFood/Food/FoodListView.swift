//
//  FoodListView.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct FoodListView: View {
    @ObservedObject var viewModel: FoodListViewModel
    @State var showDetails = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.food) { foodViewModel in
                    FoodView(viewModel: foodViewModel)
                        .onTapGesture {
                            showDetails = true
                            viewModel.selectedFood = foodViewModel
                        }
                }.navigationTitle("Food")
            }
            .blur(radius: showDetails ? 40 : 0)
            if showDetails {
                FoodCardView(viewModel: viewModel.selectedFood!, isVisible: $showDetails)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var previews: some View {
        FoodListView(viewModel: FoodListViewModel())
    }
}
