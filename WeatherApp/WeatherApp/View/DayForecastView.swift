//
//  Day.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

import SwiftUI

struct DayForecastView: View {
    
    let viewModel: DayForecastViewModel
    
    var body: some View {
        NavigationLink(destination: ForecastDetailsView(viewModel: viewModel)) {
            VStack {
                Text(viewModel.date)
                    .defaultStyle()
                Image(systemName: viewModel.icon).colorIconStyle(width: 40, height: 40, color: .white)
                Text(viewModel.dayTemperature)
                    .defaultStyle()
                
            }
        }
    }
}

struct Day_Previews: PreviewProvider {
    static var previews: some View {
        DayForecastView(viewModel: DayForecastViewModel(
            date: "Pn",
            icon: "sun.max.fill",
            dayTemperature: "-12°",
            minTemperature: "-20",
            maxTemperature: "5",
            humidity: 80,
            pressure: 1.0
        ))
    }
}
