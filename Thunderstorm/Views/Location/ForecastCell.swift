//
//  ForecastCell.swift
//  Thunderstorm
//
//  Created by Tung Le on 6/1/2025.
//

import SwiftUI

struct ForecastCell: View {
  // MARK: - Properties
  let viewModel: ForecastCellViewModel
  
  // MARK: - View
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(viewModel.day)
          .font(.title)
          .foregroundColor(.accentColor)
        Group {
          Text(viewModel.date)
          Spacer()
          Text(viewModel.summary)
        }
        .font(.body)
        .foregroundColor(.darkGray)
      }
      Spacer()       /// Spacer
      VStack(alignment: .trailing) {
        Image(systemName: viewModel.imageName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 40.0)
          .foregroundColor(.darkGray)
        Spacer()
        Text(viewModel.windSpeed)
          .font(.body)
          .foregroundColor(.darkGray)
        HStack {
            Text(viewModel.lowTemperature)
            Text("-")
            Text(viewModel.highTemperature)
        }
        .font(.body)
        .foregroundColor(.darkGray)
      }
    }
  }
} // == END

#Preview {
  ForecastCell(
    viewModel: .init(
      dayConditions: WeatherData.preview.forecast[0]
    )
  )
}
