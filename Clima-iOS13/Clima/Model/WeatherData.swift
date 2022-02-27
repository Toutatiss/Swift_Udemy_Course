//
//  WeatherData.swift
//  Clima
//
//  Created by Tatiana Kalintsev on 24/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
// Codable = Decodable + Encodable ("TYPE ALIAS!")
struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let main: String
    let id: Int
}



