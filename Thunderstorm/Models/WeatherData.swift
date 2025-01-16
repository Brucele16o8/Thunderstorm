//
//  WeatherData.swift
//  Thunderstorm
//
//  Created by Tung Le on 12/1/2025.
//

import Foundation

struct WeatherData: Decodable {
  // MARK: - Types
  
  private enum RootCodingKeys: String, CodingKey {
    case currently, daily
  }
  private enum DailyCodingKeys: String, CodingKey {
      case data
  }
  
  // MARK: - Properties
  
  let currently: CurrentConditions
  let forecast: [DayConditions]
  
  // MARK: - Initialization
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(
      keyedBy: RootCodingKeys.self
    )
    currently = try container.decode(
      CurrentConditions.self,
      forKey: .currently
    )
    let forecastContainer = try container.nestedContainer(
      keyedBy: DailyCodingKeys.self,
      forKey: .daily
    )
    forecast = try forecastContainer.decode(
      [DayConditions].self,
      forKey: .data
    )
  }
} // - END


// MARK: - EXTENSIONS
// -- 1st
extension WeatherData {
  // MARK: - Nested Structs
  
  /// --- Current Conditions
  struct CurrentConditions: Decodable {
    // MARK: - Properties
    let time: Date
    let icon: String
    let summary: String
    let windSpeed: Float
    let temperature: Float
  }
} // - End

// -- 2nd
extension WeatherData {
  // MARK: - Nested Structs
  
  struct DayConditions: Decodable {
    // MARK: - Properties
    
    let time: Date
    let icon: String
    let summary: String
    let windSpeed: Float
    let temperatureHigh: Float
    let temperatureLow: Float
  }
  
} // - End

