//
//  CoinData.swift
//  ByteCoin
//
//  Created by Tatiana Kalintsev on 29/12/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    let rate: Double // the price
    let asset_id_quote: String // the currency
    let asset_id_base: String // the coin type
}
