//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

protocol WeatherService {
    func getWeather(for city: String, callback: @escaping (Result<Weather, HttpError>) -> ())
}
