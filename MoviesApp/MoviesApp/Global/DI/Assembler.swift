//
//  Assembler.swift
//  WeatherApp
//
//  Created by Linda adel on 28/12/2023.
//

import Foundation

protocol Assembler {
    static var shareInstance: Self { get }
    func assemble()
}
