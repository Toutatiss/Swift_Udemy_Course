//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinData(_: CoinManager, coinModel: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "E59921EC-5BE3-4C9F-81AD-AE1C41FE722E"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(url)
    }
    
    func performRequest(_ urlString: String) {
        // 1: Create a url
        if let url = URL(string: urlString) {          // can fail if you have a typo (therefore optional data type )
            // 2: create url session
            let session = URLSession(configuration: .default) // thing that can perfom the networking
            // 3: give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error)
                    delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    //                    print(String(data: safeData, encoding: String.Encoding.utf8)! as String)
                    if let coinData = self.parseJSON(safeData) {
                        delegate?.didUpdateCoinData(self, coinModel: coinData)
                    }
                }
            }
            
            // 4: start the task
            task.resume()
            
        }
    }
    
    
    
    
    func parseJSON(_ data: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let price = decodedData.rate
            let curr = decodedData.asset_id_quote
            let type = decodedData.asset_id_base
            
            let coinData = CoinModel(price: price, currency: curr, coinType: type)
            return coinData

            
        } catch {
            print(error)
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
    
}
