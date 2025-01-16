//
//  AddLocationCellViewModel.swift
//  Thunderstorm
//
//  Created by Tung Le on 7/1/2025.
//

import Foundation

struct AddLocationCellViewModel: Identifiable, Equatable {
  // MARK: - Properties
  private let location: Location
  
  // MARK: - Identifiable
  var id: String {
    location.id
  }
  
  // MARK: - Initialization
  init(location: Location) {
    self.location = location
  }
  
  // MARK: - Public API
  var name: String {
    location.name
  }
  var country: String {
    location.country
  }
  var coordinates: String {
    "\(location.latitude), \(location.longitude)"
  }
} // == END
