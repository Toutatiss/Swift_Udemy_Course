//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Tatiana Kalintsev on 29/12/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    let price: Double
    let currency: String
    let coinType: String
    
    var priceString: String {
        return String(format: "%.2f", price)
    }
}
