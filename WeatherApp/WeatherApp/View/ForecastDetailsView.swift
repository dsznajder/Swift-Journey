//
//  ForecastDetails.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

import SwiftUI

struct ForecastDetailsView: View {
    
    let viewModel: DayForecastViewModel
    
    var body: some View {
        ZStack {
            GradientView(topColor: .bottom, bottomColor: .top)
            VStack {
                Text(viewModel.date).defaultStyle(size: 34)
                Image(systemName: viewModel.icon).iconStyle(width: 64, height: 64)
                Text(viewModel.dayTemperature)
                    .defaultStyle(size: 64)
                
                HStack {
                    VStack {
                        Text(LocalizedStringKey("Min"))
                            .defaultStyle()
                        Image(systemName: "thermometer.snowflake")
                            .colorIconStyle(width: 40, height: 40)
                        Text(viewModel.minTemperature)
                            .defaultStyle()
                    }
                    
                    VStack {
                        Text(LocalizedStringKey("Max"))
                            .defaultStyle()
                        Image(systemName: "thermometer.sun")
                            .colorIconStyle(width: 40, height: 40)
                        Text(viewModel.maxTemperature)
                            .defaultStyle()
                    }
                    
                }
                
                Image(systemName: "drop").colorIconStyle(width: 64, height: 64)
                Text("\(viewModel.humidity)%").defaultStyle()
                
                Spacer()
            }
        }
    }
}

struct ForecastDetails_Previews: PreviewProvider {
    static var previews: some View {
        ForecastDetailsView(viewModel: DayForecastViewModel(
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
