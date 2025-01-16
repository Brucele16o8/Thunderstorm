//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Created by Tung Le on 7/1/2025.
//

import SwiftUI

struct AddLocationCell: View {
  // MARK: - Properties
  let viewModel: AddLocationCellViewModel
  let didTapPlusButton: () -> Void
  
  // MARK: - View
  var body: some View {
    HStack {
      /// Button
      Button(action: didTapPlusButton) {
        Image(systemName: "plus")
          .padding()
          .tint(.green)
          .frame(width: 5.0, height: 5.0)
      }
      .padding(.all, 10.0)
      .background(.white)
      Spacer()  /// Spacer
        .frame(width: 20.0)
      /// Location
      VStack(alignment: .leading) {
        Text(viewModel.name)
          .font(.headline)
          .foregroundColor(.accentColor)
        Text(viewModel.country)
          .font(.subheadline)
          .foregroundColor(.gray)
        Text(viewModel.coordinates)
          .font(.caption)
          .foregroundColor(.gray)
      }
      Spacer()
    }
  }
} // == END

#Preview {
  AddLocationCell(viewModel: .init(location: .preview)) {
    ()
  }
}
