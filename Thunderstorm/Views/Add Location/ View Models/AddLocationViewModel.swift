//
//  AddLocationViewModel.swift
//  Thunderstorm
//
//  Created by Tung Le on 7/1/2025.
//

import Foundation
import Combine

@MainActor
internal final class AddLocationViewModel: ObservableObject {
  // MARK: - Properties
  @Published var query = ""
  var textFieldPlaceholder: String {
    "Enter the name of a city ..."
  }
  @Published private(set) var locations: [Location] = []
  @Published private(set) var state: State = .empty
  @Published private var isQuerying = false
    /// --- Geocoding
  private let geocodingService: GeocodingService
  private var subscriptions: Set<AnyCancellable> = []
    /// --- Store
  private let store: Store
  
  // MARK: - Initialization
  init(store: Store, geocodingService: GeocodingService) {
    self.store = store
    self.geocodingService = geocodingService
    setupBindings()
  }
  
  // MARK: - Types
  enum State: Equatable {
    // MARK: - Cases
    case empty
    case querying
    case message(String)
    case results([AddLocationCellViewModel])
  }
  
  // MARK: - Methods
  func addLocation(with id: String) {
    guard let location = locations.first(where: { $0.id == id }) else {
      return
    }
    
    // TODO: - Add Location
    do {
      try store.addLocation(location)
    } catch {
      print("Unable to Add Location \(error)")
    }
  }
  
  // MARK: - Helper Methods
  ///
  private func setupBindings() {
    $locations
      .map { $0.map(AddLocationCellViewModel.init) }
      .combineLatest($query, $isQuerying)
      .map { viewModels, query, isQuerying -> State in
        if isQuerying {
          return .querying
        }
        if query.isEmpty {
          return .empty
        }
        if viewModels.isEmpty {
          return .message("No matches found ...")
        } else {
          return .results(viewModels)
        }
      }
      .eraseToAnyPublisher()
      .removeDuplicates()
      .assign(to: &$state)
    $query
      .throttle(for: 1.0, scheduler: RunLoop.main, latest: true)
      .filter { !$0.isEmpty }
      .sink { [weak self] addressString in
        self?.geocodeAddressString(addressString)
      }
      .store(in: &subscriptions)
  }
  ///
  private func geocodeAddressString(_ addressString: String) {
    isQuerying = true
    Task {
      do {
        locations = try await geocodingService.geocodeAddressString(addressString)
      } catch {
        locations = []
        print("Unable to Geocode \(addressString) \(error)")
      }
      isQuerying = false
    }
  }
  
} // == END
