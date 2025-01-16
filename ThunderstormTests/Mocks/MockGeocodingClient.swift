//
//  MockGeocodingClient.swift
//  ThunderstormTests
//
//  Created by Tung Le on 15/1/2025.
//

import Foundation
@testable import Thunderstorm

struct MockGeocodingClient: GeocodingService {

  // MARK: - Types
  
  enum GeocodingError: Error {
    // MARK: - Cases    
    case requestFailed
  }
  
  // MARK: - Properties
  
  let result: Result<[Location], GeocodingError>
  
  // MARK: - Geocoding Service
  
  /// --- m
  func geocodeAddressString(_ addressString: String) async throws -> [Thunderstorm.Location] {
    switch result {
    case .success(let locations):
      return locations
    case .failure(let error):
      throw error
    }
  }
  
} // == END
