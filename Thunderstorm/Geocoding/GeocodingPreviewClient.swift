//
//  GeocodingPreviewClient.swift
//  Thunderstorm
//
//  Created by Tung Le on 8/1/2025.
//

import Foundation

struct GeocodingPreviewClient: GeocodingService {
  // MARK: - Geocoding Service
  func geocodeAddressString(_ addressString: String) async throws -> [Location] {
      Location.previews
  }
  
} // == END
