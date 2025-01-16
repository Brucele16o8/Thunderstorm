//
//  GeocodingService.swift
//  Thunderstorm
//
//  Created by Tung Le on 8/1/2025.
//

import Foundation

protocol GeocodingService {
  // MARK: - Methods

  func geocodeAddressString(_ addressString: String) async throws -> [Location]
} // == END
