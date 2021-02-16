//
//  GradientView.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

import SwiftUI

struct GradientView: View {
    
    let topColor: Color
    let bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView(topColor: .top, bottomColor: .bottom)
    }
}
