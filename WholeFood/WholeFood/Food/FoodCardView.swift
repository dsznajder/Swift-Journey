//
//  FoodCardView.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct FoodCardView: View {
    
    let viewModel: FoodViewModel
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack {
            Image(viewModel.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 200)

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
            
            Button {
                print("Add")
            } label: {
                Text("Add to cart")
                    .fontWeight(.bold)
                    .frame(width: 250, height: 40)
                    .foregroundColor(.white)
                    .background(Color("primary"))
            }
            .padding()
            .cornerRadius(10)
        }
        .background(Color(.systemBackground))
        .shadow(radius: 10)
        .overlay(Button { isVisible = false }
                    label: {
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .opacity(0.7)
                            Image(systemName: "xmark")
                                .foregroundColor(Color("primary"))
                                .frame(width: 40, height: 40)
                        }
                        .padding(.all, 4)
                    }, alignment: .topTrailing)
    }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCardView(
            viewModel: FoodViewModel(id: 1, name: "Asparagus Steak", description: "Stejki", price: 12.21, imageUrl: "asparagus-steak"),
            isVisible: .constant(true)
        )
    }
}
