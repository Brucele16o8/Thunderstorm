//
//  Store.swift
//  Thunderstorm
//
//  Created by Tung Le on 12/1/2025.
//

import Foundation
import Combine

protocol Store {
  // MARK: - Properties
  var locationsPublisher: AnyPublisher<[Location], Never> { get }
  
  // MARK: - Methods  
  func addLocation(_ location: Location) throws
  func removeLocation(_ location: Location) throws
  
}
