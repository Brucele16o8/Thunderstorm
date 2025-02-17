//
//  UserDefaults+Helpers.swift
//  Thunderstorm
//
//  Created by Tung Le on 12/1/2025.
//

import Foundation

extension UserDefaults {
  // MARK: - Types
  private enum Keys {
    static let locations = "locations"
  }
  
  // MARK: - Public API
  @objc var locations: Data? {
    get {
      data(forKey: Keys.locations)
    }
    set {
      set(newValue, forKey: Keys.locations)
    }
  }
  
  /// --- m
  func addLocation(_ location: Location) throws {
    var locations = try decode(
      [Location].self,
      forKey: Keys.locations
    ) ?? []
    locations.append(location)
    
    try encode(
      locations,
      forKey: Keys.locations
    )
  }
  
  /// --- m
  func removeLocation(_ location: Location) throws {
    var locations = try decode(
      [Location].self,
      forKey: Keys.locations
    ) ?? []
    locations.removeAll { $0.id == location.id }
    try encode(
      locations,
      forKey: Keys.locations
    )
  }
} // == END


// MARK: - EXTENSIONS
fileprivate extension UserDefaults {
  // MARK: - Methods
  /// -----
  func decode<T: Decodable>(_ type: T.Type, forKey key: String) throws -> T? {
    guard let data = data(forKey: key) else {
      return nil
    }
    return try? JSONDecoder().decode(type, from: data)
  }
  
  /// -----
  func encode<T: Encodable>(_ value: T, forKey key: String) throws {
    let data = try JSONEncoder().encode(value)
    set(data, forKey: key)
  }
} // == End
