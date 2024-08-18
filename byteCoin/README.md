#  ByteCoin
---

## Our Goal

*  We’re going to introduce you to the wonderful world of Application Programming Interfaces (APIs) to grab live data from the internet. 
---

## What you will create
* By the end of this project, you will have developed a fully functional app that showcases live Bitcoin prices in different currencies. The app is designed with a dark-mode theme and includes a responsive user interface that adapts to user inputs.
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
func getCoinPrice(for currency: String) {
    let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
    print(urlString)

    if let url = URL(string: urlString) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                //self.delegate?.didFailWithError
                return
            } else {
                if let safeData = data {
                    if let bitcoinPrice = self.parseJson(safeData) {
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        //self.delegate?.didupdateprice
                    }
                }
            }
            task.resume()
        }

    }
}
```

```
 func parseJson(_ data: Data) -> Double? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            let lastPrice = decodedData.rate
            return lastPrice
        } catch {
            // delegate?.didFailwithError
            return nil
        }
    }
```

> MVC - C

```
//MARK: - UIPickerView DataSource & Delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return coinManager.currencyArray.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return coinManager.currencyArray[row]
      }
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          let selectedCurrency = coinManager.currencyArray[row]
          coinManager.getCoinPrice(for: selectedCurrency)
      }
}
```

```
//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    
    func didUpdatePrice(price: String, currency: String) {
        
        DispatchQueue.main.async {
            self.bitcoinLabel.text = price
            self.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
```

---

## Completion

> Completed Screen

<img src="https://github.com/user-attachments/assets/f2a6cac8-1fb3-40ef-883b-2664411925c4" width="200" height="400"/>