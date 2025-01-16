//
//  MockStore.swift
//  ThunderstormTests
//
//  Created by Tung Le on 15/1/2025.
//

import Combine
import Foundation
@testable import Thunderstorm

final class MockStore: Store {
  // MARK: - Properties
  
  @Published private(set) var locations: [Location]
  
  var locationsPublisher: AnyPublisher<[Thunderstorm.Location], Never> {
    $locations
      .eraseToAnyPublisher()
  }
  
  // MARK: - Initialization

  init(locations: [Location] = []) {
      self.locations = locations
  }
  

  func addLocation(_ location: Thunderstorm.Location) throws {
    locations.append(location)
  }
  
  func removeLocation(_ location: Thunderstorm.Location) throws {
    locations.removeAll { $0.id == location.id }
  }
  
  
} // == END
