//
//  WeatherManager.swift
//  Clima
//
//  Created by 홍규강 on 8/14/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func did
    func didFailWithError
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=5507f06ac317410fee98abea024e898c"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees,longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
//    1) create a URL
//    2) create a url session
//    3) give url session a task -> 만약 에러가 존재한다면 -> didFailWithError -> 그게 아니라면 safeData -> weather ->didUpdateWeather
    func performRequest(with urlString: String) {
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailWithError(error: error!)
                return
            } if let safeData = data {
                if let weather = self.parsonJson(safeData)  {
                self.delegate?.didUpdateWeather(self, weather: weather)
                }
            }
        }
        task.resume()
    }
    
//    do - catch {try decoder decodedData id temp name weather}
    func parsonJson(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decoderData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decoderData.weather[0].id
            let temp = decoderData.main.temp
            let name = decoderData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
            
        }
    }
    
}


