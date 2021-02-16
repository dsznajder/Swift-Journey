//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ForecastView(viewModel: ForecastViewModel(weatherService: URLSessionWeatherService()))
        }
    }
}
