//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

//MARK: - CoinManagerDelegate
protocol CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

//MARK: - CoinManager
struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "B18AB719-43EF-40BE-921F-0259D8D82622"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
//MARK: -  getCoinPrice(for currency: String)
    func getCoinPrice(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        print(urlString)
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                } else {
                    if let safeData = data {
                        if let bitcoinPrice = self.parseJson(safeData) {
                            let priceString = String(format: "%.2f", bitcoinPrice)
                            self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                        }
                    }
                }
                
            }
            task.resume()
        }
    }
//MARK: -  parseJSON
    func parseJson(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            return lastPrice
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}
