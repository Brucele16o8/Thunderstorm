//
//  LocationsView.swift
//  Thunderstorm
//
//  Created by Tung Le on 4/1/2025.
//

import SwiftUI

struct LocationsView: View {
  // MARK: - Properties
  @ObservedObject private(set) var viewModel: LocationsViewModel
  @State private var showsAddLocationView = false
  
  // MARK: - View
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: [GridItem()], spacing: 20.0) {
          Button(viewModel.addLocationTitle) {
            showsAddLocationView.toggle()
          }
          .padding()
          .foregroundColor(.white)
          .background(Color.accentColor)
          .clipShape(Capsule())
          ForEach(viewModel.locationCellViewModels) { viewModel in
            NavigationLink {
              LocationView(viewModel: viewModel.locationViewModel)
            } label: {
              LocationCell(viewModel: viewModel)
            }
            
          }
        }
        .padding()
      }
      .navigationTitle("Thunderstorm")
      .sheet(isPresented: $showsAddLocationView) {
        AddLocationView(
          viewModel: viewModel.addLocationViewModel,
          showsAddLocationView: $showsAddLocationView
        )
      }
    }
    .onAppear {
      viewModel.start()
    }
  }
  
} // END

#Preview {
  LocationsView(
    viewModel: .init(
      store: PreviewStore(),
      weatherService: WeatherPreviewClient()
    )
  )
}
