//
//  FoodImage.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct FoodImage: View {
    
    @StateObject private var viewModel = RemoteImageViewModel()
    var urlString: String
    
    var body: some View {
        RemoteImageView(image: viewModel.image)
            .onAppear { viewModel.load(urlString: urlString) }
    }
    
}
