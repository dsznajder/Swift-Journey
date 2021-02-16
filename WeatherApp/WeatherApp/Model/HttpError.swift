//
//  HttpError.swift
//  WeatherApp
//
//  Created by Damian Sznajder on 15/02/2021.
//

enum HttpError: Error {
  case requestFailed
  case invalidData
  case malformedUrl
  case parsingFailed
}
