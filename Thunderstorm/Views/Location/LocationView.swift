//
//  LocationView.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import SwiftUI

struct LocationView: View {
  // MARK: - Properties
  @ObservedObject var viewModel: LocationViewModel
  
  // MARK: - View
  var body: some View {
    VStack(alignment: .leading, spacing: 0.0) {
      switch viewModel.state {
      case .fetching:
        ProgressView()
      case let .data(currentConditionsViewModel: currentConditionsViewModel, forecastViewModel: forecastViewModel):
        /// --- Current View
        CurrentConditionsView(
          viewModel: currentConditionsViewModel
        )
        Divider() /// --- Divider
        /// --- Forcast View
        ForecastView(
          viewModel: forecastViewModel
        )
      case .error(message: let message):
        Text(message)
          .padding()
          .foregroundColor(.accentColor)
          .multilineTextAlignment(.center)
      }
    }
    .navigationTitle(viewModel.locationName)
    .task {
      await viewModel.start()
    }
  }
} // == END

#Preview {
  NavigationView {
    LocationView(
      viewModel: .init(
        location: .preview,
        weatherService: WeatherPreviewClient())
    )
  }
}
