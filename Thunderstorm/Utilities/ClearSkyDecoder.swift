//
//  ClearSkyDecoder.swift
//  Thunderstorm
//
//  Created by Tung Le on 13/1/2025.
//

import Foundation

final class ClearSkyDecoder: JSONDecoder {
  // MARK: - Initialization
  
  override init() {
    super.init()
    dateDecodingStrategy = .secondsSince1970
  }
} // - END
