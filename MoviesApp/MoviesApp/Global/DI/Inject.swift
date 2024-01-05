//
//  Inject.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
@propertyWrapper
struct Inject<T> {
    let wrappedValue: T
    
    init() {
        self.wrappedValue = DIContainer.shared.resolve()
    }
}
