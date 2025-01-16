//
//  WeatherPreviewClient.swift
//  Thunderstorm
//
//  Created by Tung Le on 13/1/2025.
//

import Foundation

struct WeatherPreviewClient: WeatherService {
  // MARK: - Methods
  func weather(for location: Location) async throws -> WeatherData {
    .preview
  }
}

