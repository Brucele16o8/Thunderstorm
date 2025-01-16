//
//  AddLocationView.swift
//  Thunderstorm
//
//  Created by Tung Le on 7/1/2025.
//

import SwiftUI

struct AddLocationView: View {
  // MARK: - Properties
  @ObservedObject var viewModel: AddLocationViewModel
  var showsAddLocationView: Binding<Bool>
  
  // MARK: - View
  var body: some View {
    VStack(alignment: .leading) {
      TextField(viewModel.textFieldPlaceholder, text: $viewModel.query)
        .padding()
      switch viewModel.state {
      case .empty:
        Spacer()
      case .querying:
        MessageView(style: .progressView)
      case .message(let message):
        MessageView(style: .message(message))
      case .results(let viewModels):
        // List for view model
        List {
          ForEach(viewModels) { cellViewModel in
            AddLocationCell(viewModel: cellViewModel) {
              viewModel.addLocation(with: cellViewModel.id)
              showsAddLocationView.wrappedValue.toggle()
            }
          }
        }
      }

    }    
  }
} // == END

#Preview {
  let viewModel = AddLocationViewModel(
    store: PreviewStore(),
    geocodingService: GeocodingPreviewClient()
  )
  
  AddLocationView(
    viewModel: viewModel,
    showsAddLocationView: .constant(true)
  )
}


// MARK: - Helpers
fileprivate struct MessageView: View {
  // MARK: - Types
  enum Style {
    // MARK: - Cases
    case progressView
    case message(String)
  }
  
  // MARK: - Properties
  let style: Style
  
  // MARK: - View
  var body: some View {
    VStack {
      Spacer()
      switch style {
      case .progressView:
        ProgressView()
      case .message(let message):
        Text(message)
          .font(.body)
          .foregroundColor(.darkGray)
      }
      Spacer()
    }
  }
}
