//
//  Container+Helpers.swift
//  Thunderstorm
//
//  Created by Tung Le on 15/1/2025.
//

import Foundation
import Swinject

extension Container {
  // MARK: - Properties
  static let shared = Container()
  
  // MARK: - Services
  
  static var store: Store {
    shared.resolve(Store.self)!
  }
} // == END
