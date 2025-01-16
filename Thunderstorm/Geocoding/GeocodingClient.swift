//
//  GeocodingClient.swift
//  Thunderstorm
//
//  Created by Tung Le on 8/1/2025.
//

import Foundation
import CoreLocation

final class GeocodingClient: GeocodingService {
  // MARK: - Types
  enum GeocodingError: Error {
    case invalidAddressString
    case requestFailed
  }
  
  // MARK: - Properties
  private let geocoder: Geocoder
  
  // MARK: - Initialization
  init(geocoder: Geocoder = CLGeocoder()) {
    self.geocoder = geocoder
  }
  
  // MARK: - Geocoding Service
  func geocodeAddressString(_ addressString: String) async throws -> [Location] {
    guard !addressString.isEmpty else {
      throw GeocodingError.invalidAddressString
    }
    
    do {
      return try await geocoder
        .geocodeAddressString(addressString)
        .compactMap(Location.init(placemark:))
    } catch {
      print("Unable to Geocode Address String \(error)")
      throw GeocodingError.requestFailed
    }
  }
  
} // == END
