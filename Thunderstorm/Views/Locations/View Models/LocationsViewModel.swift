//
//  LocationsViewModel.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import Foundation

@MainActor
final class LocationsViewModel: ObservableObject {
  // MARK: - Properties
  private let store: Store
  private let weatherService: WeatherService
  var title: String {
    "Thunderstorm"
  }
  var addLocationTitle: String {
    "Add a Location"
  }
  @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []
  @MainActor
  var addLocationViewModel: AddLocationViewModel {
    AddLocationViewModel(
      store: store,
      geocodingService: GeocodingClient()
    )
  }
  
  // MARK: - Initialization
    /// ---
  init(
    store: Store,
    weatherService: WeatherService
  ) {
    self.store = store
    self.weatherService = weatherService
  }
  
  // MARK: - Methods
  
  func start() {
    let weatherService = self.weatherService
    
    store.locationsPublisher
      .map { locations in
        locations.map { location in
          LocationCellViewModel(
            location: location,
            weatherService: weatherService
          )
        }
      }
      .eraseToAnyPublisher()
      .assign(to: &$locationCellViewModels)
  }
} // == END
