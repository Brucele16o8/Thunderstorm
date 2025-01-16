//
//  LocationCell.swift
//  Thunderstorm
//
//  Created by Tung Le on 5/1/2025.
//

import SwiftUI

struct LocationCell: View {
  // MARK: - Properties
  @ObservedObject var viewModel: LocationCellViewModel
  
  // MARK: - View
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(viewModel.locationName)
          .font(.title)
          .foregroundStyle(.accent)
        Text(viewModel.locationCountry)
          .font(.body)
          .foregroundStyle(.gray)
        Spacer()
        if let summary = viewModel.summary {
          Text(summary)
        }
      }
      Spacer() /// for HStack
      if
        let temperature = viewModel.temperature,
        let windSpeed = viewModel.windSpeed
      {
        VStackLayout(alignment: .trailing) {
          HStack {
            Image(systemName: "thermometer")
              .foregroundStyle(.gray)
            Text("\(temperature)°")
          }
          HStack {
            Image(systemName: "thermometer")
              .foregroundStyle(.gray)
            Text(windSpeed)
          }
          Spacer()
        }
      } else {
        ProgressView()
      }
    }
    .padding()
    .overlay {
      RoundedRectangle(cornerRadius: 10.0)
        .stroke(Color.gray)
        .opacity(0.25)
    }
    .task {
      await viewModel.start()
    }
  }
}

#Preview {
  let viewModel = LocationCellViewModel(
    location: .preview,
    weatherService: WeatherPreviewClient()
  )
  
  return LocationCell(viewModel: viewModel)
}
