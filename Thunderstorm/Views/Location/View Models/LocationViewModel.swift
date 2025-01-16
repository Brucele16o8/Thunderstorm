//
//  LocationViewModel.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import Foundation
import Swinject

@MainActor
final class LocationViewModel: ObservableObject {
  // MARK: - Types

  enum State {
      // MARK: - Cases
      case fetching
      case data(
          currentConditionsViewModel: CurrentConditionsViewModel,
          forecastViewModel: ForecastViewModel
      )
      case error(message: String)
  }
  
  // MARK: - Properties
  private let location: Location  
  var locationName: String {
      location.name
  }
  
  // MARK: -

  private let weatherService: WeatherService
  
  // MARK: -
  @Published private(set) var state: State = .fetching
  
  // MARK: - Initialization
  init(
      location: Location,
      weatherService: WeatherService
  ) {
      self.location = location
      self.weatherService = weatherService
  }
  
  // MARK: - Public API
  
  func start() async {
    do {
      let data = try await weatherService.weather(for: location)
      
      state = .data(
        currentConditionsViewModel: .init(
          location: location,
          store: Container.store,
          currently: data.currently
        ),
        forecastViewModel: .init(forecast: data.forecast)
      )
    } catch {
      print("Unable to Fetch Weather Data \(error)")
      state = .error(message: "Thunderstorm isn't able to display weather data for \(locationName). Please try again later.")
    }
  }
  
} // === END
