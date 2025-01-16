//
//  Configuration.swift
//  Thunderstorm
//
//  Created by Tung Le on 13/1/2025.
//

import Foundation

enum Configuration {
  // MARK: - Types
  
  private enum Keys {
    static let clearSkyBaseURL = "CLEAR_SKY_BASE_URL"
    static let clearSkyAPIKey = "CLEAR_SKY_API_KEY"
  }
  
  // MARK: - Properties
  
  private static var infoDictionary: [String: Any] {
    Bundle.main.infoDictionary ?? [:]
  }
  static var clearSkyBaseURL: URL {
      let urlAsString = infoDictionary[Keys.clearSkyBaseURL] as! String
      return URL(string: urlAsString)!
  }
  static var clearSkyAPIKey: String {
      infoDictionary[Keys.clearSkyAPIKey] as! String
  }
} // == END
