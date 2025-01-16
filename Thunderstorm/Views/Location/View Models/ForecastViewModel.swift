//
//  ForecastViewModel.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import Foundation

struct ForecastViewModel {
  // MARK: - Properties

  private let forecast: [WeatherData.DayConditions]
  
  var forecastCellViewModels: [ForecastCellViewModel] {
    forecast.map(ForecastCellViewModel.init(dayConditions:))
  }
  
  // MARK: - Initialization

  init(forecast: [WeatherData.DayConditions]) {
      self.forecast = forecast
  }
} // == END
