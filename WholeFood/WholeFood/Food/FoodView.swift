//
//  FoodView.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct FoodView: View {
    
    let viewModel: FoodViewModel
    
    var body: some View {
        HStack {
            Image(viewModel.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 80)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.title3)
                    .fontWeight(.bold)
                Text(viewModel.description)
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(2)
                Text(viewModel.priceText)
                    .font(.body)
                    .foregroundColor(Color("primary"))
                    .lineLimit(2)
            }
        }
    }
}

struct FoodView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView(viewModel: FoodViewModel(id: 1, name: "Asparagus Steak", description: "Stejki", price: 12.21, imageUrl: "asparagus-steak"))
    }
}
