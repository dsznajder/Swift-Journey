//
//  RemoteImageViewModel.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import SwiftUI

final class RemoteImageViewModel: ObservableObject {
    
    private let imageLoader = ImageLoader()
    
    @Published var image: Image? = nil
    
    func load(urlString: String) {
        imageLoader.get(from: urlString) {
            guard let uiImage = $0 else { return }
            
            DispatchQueue.main.async { [self] in
                image = Image(uiImage: uiImage)
            }
        }
    }
}
