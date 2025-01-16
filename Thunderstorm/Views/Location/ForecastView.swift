//
//  ForecastView.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import SwiftUI

struct ForecastView: View {
  // MARK: - Properties
  let viewModel: ForecastViewModel
  
  // MARK: - View
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem()]) {
        ForEach(viewModel.forecastCellViewModels) { viewModel in
          ForecastCell(viewModel: viewModel)
        }
      }
      .padding()
    }
  }
} // == END

#Preview {
  ForecastView(viewModel: .init(
    forecast: WeatherData.preview.forecast
  )
  )
}
