//
//  DayForecastViewModel.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

import Foundation

struct DayForecastViewModel: Identifiable {
    let id = UUID()
    let date: String
    let icon: String
    let dayTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: Int
    let pressure: Double
}
