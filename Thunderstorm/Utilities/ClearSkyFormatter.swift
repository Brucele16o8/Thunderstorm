//
//  ClearSkyFormatter.swift
//  Thunderstorm
//
//  Created by Tung Le on 13/1/2025.
//

import Foundation

struct ClearSkyFormatter {
  // MARK: - Properties
  
  private let measurementFormatter = MeasurementFormatter()
  
  // MARK: - Initialization
  
  init(locale: Locale = .current) {
    let numberFormatter = NumberFormatter()
    numberFormatter.locale = locale
    
    measurementFormatter.locale = locale
    measurementFormatter.numberFormatter = numberFormatter
  }
  
  // MARK: - Methods
  /// --- m
  func formatWindSpeed(_ windSpeed: Float) -> String {
    let measurement = Measurement(
      value: Double(windSpeed),
      unit: UnitSpeed.milesPerHour
    )
    return measurementFormatter.string(from: measurement)
  }
  
  /// --- m
  func formatTemperature(_ temperature: Float) -> String {
    let measurement = Measurement(
      value: Double(temperature),
      unit: UnitTemperature.fahrenheit
    )
    
    return measurementFormatter.string(from: measurement)
  }
} // == END
