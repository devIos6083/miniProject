#  Clima
---

## Our Goal

*  We’re going to introduce you to the wonderful world of Application Programming Interfaces (APIs) to grab live data from the internet. 
---

## What you will create

* By the end of the module, you will have made a beautiful, dark-mode enabled weather app. 
* You'll be able to check the weather for the current location based on the GPS data from the iPhone as well as by searching for a city manually. 
---

## What you will learn

* How to create a dark-mode enabled app.
* How to use vector images as image assets.
* Learn to use the UITextField to get user input. 
* Learn about the delegate pattern.
* Swift protocols and extensions. 
* Swift guard keyword. 
* Swift computed properties.
* Swift closures and completion handlers.
* Learn to use URLSession to network and make HTTP requests.
* Parse JSON with the native Encodable and Decodable protocols. 
* Learn to use Grand Central Dispatch to fetch the main thread.
* Learn to use Core Location to get the current location from the phone GPS. 
--- 

## Core code

> MVC - M

```
func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }

    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
```

> MVC - C

```
extension WeatherViewController: CLLocationManagerDelegate {
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    


}
```

---

## Completion

> Initial Screen

<img width="312" alt="스크린샷 2024-08-14 오후 8 41 10" src="https://github.com/user-attachments/assets/59479307-d15e-463f-85ab-bf66cf9abc0f">

> Enter the desired text in TextField

<img width="349" alt="스크린샷 2024-08-14 오후 8 41 20" src="https://github.com/user-attachments/assets/8b06bb66-913d-4d2f-b8cb-b57eec813cfb">

> dark Mode

<img width="322" alt="스크린샷 2024-08-15 오후 7 09 50" src="https://github.com/user-attachments/assets/eed9dbb4-ae0b-4c1c-96e0-5f13a6283a23">

> a completed screen

<img width="317" alt="스크린샷 2024-08-14 오후 8 41 28" src="https://github.com/user-attachments/assets/d06431d9-33ab-47b1-b7fc-4b12adf049d5">
---


