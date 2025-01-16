//
//  LocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import Foundation

@MainActor
final class LocationCellViewModel: Identifiable, ObservableObject {
  // MARK: - Properties
  private let location: Location
  
  // MARK: -
  var locationViewModel: LocationViewModel {
    .init(location: location, weatherService: weatherService)
  }
  private let weatherService: WeatherService
  @Published private var weatherData: WeatherData?
  private let measurementFormatter = ClearSkyFormatter()
  
  // MARK: - Initialization
  init(
      location: Location,
      weatherService: WeatherService
  ) {
    self.location = location
    self.weatherService = weatherService
  }
  
  // MARK: - Public API
  var locationName: String {
      location.name
  }
  var locationCountry: String {
      location.country
  }
  var summary: String? {
    weatherData?.currently.summary
  }
  var windSpeed: String? {
    guard let windSpeed = weatherData?.currently.windSpeed else {
      return nil
    }

    return measurementFormatter.formatWindSpeed(windSpeed)
  }
  var temperature: String? {
    guard let temperature = weatherData?.currently.temperature else {
      return nil
    }
    
    return measurementFormatter.formatTemperature(temperature)
  }
  
  // MARK: - Methods
  func start() async {
    do {
      weatherData = try await weatherService.weather(for: location)
    } catch {
      print("Unable to Fetch Weather Data for Location \(error)")
    }
  }  
  
} // END
