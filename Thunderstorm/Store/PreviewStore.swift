//
//  PreviewStore.swift
//  Thunderstorm
//
//  Created by Tung Le on 12/1/2025.
//

import Foundation
import Combine

final class PreviewStore: Store {
  // MARK: - Properties
  
  @Published private var locations = Location.previews
  
  // MARK: -
  var locationsPublisher: AnyPublisher<[Location], Never> {
    $locations
      .eraseToAnyPublisher()
  }
  
  // MARK: - Methods
  /// --- m
  func addLocation(_ location: Location) throws {
    locations.append(location)
  }
  
  /// --- m
  func removeLocation(_ location: Location) throws {
      locations.removeAll { $0.id == location.id }
  }
} // == END
