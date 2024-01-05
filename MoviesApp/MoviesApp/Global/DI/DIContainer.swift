//
//  DIContainer.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation
//represents a closure that resolves a dependency by returning an instance of it.
//typealias DependencyResolver = () -> Any?

class DIContainer {
    
    private var dependenciesStorage: [String: Any] = [:]
    
    static let shared = DIContainer()
    private init() {}
    
    func register<T>(_ dependency: T){
        
        let key = String(describing: T.self)
        dependenciesStorage[key] = dependency
    }
    
    func resolve<T>() ->T{
        
        let key = String(describing: T.self)
        guard let dependency = dependenciesStorage[key] as? T else {
            fatalError("\(key) has not been added as an object.")
        }
        
        return dependency
    }
  
}
