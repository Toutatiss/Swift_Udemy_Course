//
//  WeatherModel.swift
//  Clima
//
//  Created by Tatiana Kalintsev on 25/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String { // computed property
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200, 201, 202, 230, 231, 232: // NOTE: you can do ranges!! e.g. 200...232
            return "cloud.bolt.rain"
        case 210, 211, 212, 221:
            return "cloud.bolt"
        case 300, 301, 302, 310, 311, 312, 313, 314, 321, 520:
            return "cloud.drizzle"
        case 500, 501, 521:
            return "cloud.rain"
        case 502, 503, 504, 522, 531:
            return "cloud.heavyrain"
        case 511:
            return "cloud.hail"
        case 600, 601, 602, 621, 622:
            return "cloud.snow"
        case 611, 612, 613, 615, 616, 620:
            return "cloud.sleet"
        case 701, 741, 721, 761, 762:
            return "cloud.fog"
        case 711, 804:
            return "smoke"
        case 771:
            return "wind.snow"
        case 781:
            return "tornado"
        case 751, 731:
            return "wind"
        case 800:
            return "sun.max"
        case 801, 802, 803:
            return "cloud"
        default:
            return "cloud"
        }
    }

    
    
}
