//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

import Foundation

final class ForecastViewModel: ObservableObject {
    
    private let weatherService: WeatherService
    
    @Published var city = ""
    @Published var temperature = ""
    @Published var icon = "sun.max.fill"
    @Published var forecast: [DayForecastViewModel] = []
    @Published var loadingError = false
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormattter = DateFormatter()
        dateFormattter.locale = Locale(identifier: Locale.preferredLanguages[0])
        dateFormattter.dateFormat = "E"
        return dateFormattter
    }()
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func getWeather(for city: String) {
        loadingError = false
        if city.isEmpty {
            return
        }
        
        weatherService.getWeather(for: city) { [self] result in
            switch result {
            case .success(let weather):
                to(weather: weather)
            case .failure(_):
                loadingError = true
            }
        }
    }
    
    private func to(weather: Weather) {
        city = weather.city.name
        if let currentForecast = weather.forecast.first, let icon = currentForecast.description.first?.icon {
            temperature = format(temperature: currentForecast.temperature.day)
            self.icon = to(icon: icon)
        }
        
        forecast = weather.forecast.dropFirst().map(to(forecast:))
    }
    
    private func to(forecast: Forecast) -> DayForecastViewModel {
        return DayForecastViewModel(
            date: dateFormatter.string(from: Date(timeIntervalSince1970: forecast.date)),
            icon: to(icon: forecast.description.first?.icon ?? ""),
            dayTemperature: format(temperature: forecast.temperature.day),
            minTemperature: format(temperature: forecast.temperature.min),
            maxTemperature:  format(temperature: forecast.temperature.max),
            humidity: forecast.humidity,
            pressure: forecast.pressure
        )
    }
    
    private func to(icon: String) -> String {
        switch icon {
        case "01d", "01n":
            return "sun.max.fill"
        case "02d", "02n":
            return "cloud.sun.fill"
        case "03d", "03n":
            return "cloud.fill"
        case "04d", "04n":
            return "smoke.fill"
        case "09d", "09n":
            return "cloud.rain.fill"
        case "10d", "10n":
            return "cloud.sun.rain.fill"
        case "11d", "11n":
            return "cloud.sun.bolt.fill"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "cloud.fog.fill"
        default:
            return "xmark.circle"
        }
    }
    
    private func format(temperature: Double) -> String {
        "\(Int(temperature))°"
    }
}
