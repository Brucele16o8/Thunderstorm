//
//  CurrentConditionsViewModel.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import Foundation

struct CurrentConditionsViewModel {
  // MARK: - Properties
  
  private let currently: WeatherData.CurrentConditions
  private let measurementFormatter = ClearSkyFormatter()
  private let location: Location
  private let store: Store
  
  // MARK: - Initialization

  init(
      location: Location,
      store: Store,
      currently: WeatherData.CurrentConditions
  ) {
      self.location = location
      self.store = store
      self.currently = currently
  }
  
  // MARK: - Public API - variables
  var summary: String {
    currently.summary
  }
  var windSpeed: String {
    measurementFormatter.formatWindSpeed(currently.windSpeed)
  }
  var temperature: String {
    measurementFormatter.formatTemperature(currently.temperature)
  }
  
  // MARK: - Public API - Methods
  /// --- m
  func delete() {
    do {
      try store.removeLocation(location)
    } catch {
      print("Unable to Remove Location \(error)")
    }
  }
} // == END
