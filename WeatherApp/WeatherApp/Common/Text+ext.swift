//
//  Text+ext.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

import SwiftUI

extension Text {
    func defaultStyle(size: CGFloat = 18) -> some View {
        self
            .font(.system(size: size, weight: .medium))
            .foregroundColor(.white)
    }
}
