//
//  Weather.swift
//  APILesson
//
//  Created by berdy on 22.02.24.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Temperature
}

struct Temperature: Codable {
    let temp: Double
}
