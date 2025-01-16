//
//  WeatherService.swift
//  Thunderstorm
//
//  Created by Tung Le on 13/1/2025.
//

import Foundation

protocol WeatherService {
  // MARK: - Methods
  func weather(for location: Location) async throws -> WeatherData
}
