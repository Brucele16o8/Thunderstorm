//
//  WeatherData+Preview.swift.swift
//  Thunderstorm
//
//  Created by Tung Le on 12/1/2025.
//

import Foundation

extension WeatherData {
  static var preview: Self {
    let url = Bundle.main.url(
      forResource: "clearsky",
      withExtension: "json"
    )!
    let data = try! Data(contentsOf: url)
    
    return try! ClearSkyDecoder().decode(
      WeatherData.self,
      from: data
    )
  }
  
} // - END
