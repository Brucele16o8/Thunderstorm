//
//  WeatherClient.swift
//  Thunderstorm
//
//  Created by Tung Le on 13/1/2025.
//

import Foundation

final class WeatherClient: WeatherService {
  
  // MARK: - Types
  enum NetworkError: Error {
      case invalidResponse
      case decodingFailed
      case serverError(statusCode: Int)
  }
  
  // MARK: - Properties
  
  private let baseURL: URL
  private let apiKey: String
  
  // MARK: - Initialization

  init(
      baseURL: URL = Configuration.clearSkyBaseURL,
      apiKey: String = Configuration.clearSkyAPIKey
  ) {
      self.baseURL = baseURL
      self.apiKey = apiKey
  }

  
  // MARK: - Methods

  func weather(for location: Location) async throws -> WeatherData {
    let queryItems: [URLQueryItem] = [
            .init(name: "lat", value: "\(location.latitude)"),
            .init(name: "long", value: "\(location.longitude)"),
            .init(name: "api_key", value: apiKey)
        ]
    let url = baseURL.appending(queryItems: queryItems)
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
//    print("Final URL: \(url)") // Debug the URL
    
    // Perform the network request
    let (data, response) = try await URLSession.shared.data(for: request)
    
    // Ensure the response is an HTTPURLResponse
    guard let httpResponse = response as? HTTPURLResponse else {
        throw NetworkError.invalidResponse
    }
    
    // Check the status code
    guard (200...299).contains(httpResponse.statusCode) else {
        throw NetworkError.serverError(statusCode: httpResponse.statusCode)
    }
    
    return try ClearSkyDecoder().decode(
        WeatherData.self,
        from: data
    )
  }
}
