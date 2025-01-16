//
//  Geocoder.swift
//  Thunderstorm
//
//  Created by Tung Le on 10/1/2025.
//

import CoreLocation

protocol Geocoder {
  func geocodeAddressString(_ addressString: String) async throws -> [CLPlacemark]
}
