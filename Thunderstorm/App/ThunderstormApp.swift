//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Created by Tung Le on 4/1/2025.
//

import SwiftUI
import Swinject

@main
struct ThunderstormApp: App {
  
  // MARK: - Initialization

  init() {
      registerServices()
  }
  
  // -- Body
  var body: some Scene {
    WindowGroup {
      LocationsView(
        viewModel: .init(
          store: Container.store,
          weatherService: WeatherClient()
        )
      )
    }
  }
  
  // MARK: - Helper Methods
  /// --- m
  private func registerServices() {
    Container.shared.register(Store.self) { _ in
      UserDefaults.standard
    }
  }
} // == END
