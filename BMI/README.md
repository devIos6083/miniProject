#  BMI Calculator
---

## 목표

* 옵셔널에 대해 더 깊이 학습하기
* MVC 디자인 패턴에 대해 학습하기
* class와 struct를 통해 구조화 함
---

## 만들 결과물

* 체질량 지수(BMI) 계산기를 만들어 봄
* 사용자의 체중과 키를 바탕으로 체질량 지수를 계산하고, 사용자에 대해 건강에 대한 조언을 제공함
---

## 사용된 기술 stack

* How to create multi-screen apps with animated navigation.
* Optional binding, optional chaining and the nil coalescing operator.
* How to create classes and difference between classes and structs. 
* Pass by value vs. pass by reference. 
* Formatting Strings. 
* Color literals.
---

## CODE

* Model

> CalculatorBrain

```
import UIKit

struct CalculatorBrain {

    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }
    }    
}
```

> BMI

```
import UIKit

struct BMI {
    let value: Float
    let advice: String
    let color: UIColor   
}
```

* View 화면 - StoryBoard를 이용해 구성함

* Controller

> CalculateViewController

```
class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.2f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            
        }
    }
}
```

> ResultViewController

```
class ResultViewController: UIViewController {

    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
    
}
```


---

## 결과물

* 초기 화면

<img width="341" alt="스크린샷 2024-08-08 오후 8 04 37" src="https://github.com/user-attachments/assets/c2d4a09d-d2e8-428b-b1d1-5dcfdb80ca97">

* bmi를 계산 후, 완성된 화면

<img width="335" alt="스크린샷 2024-08-08 오후 8 04 42" src="https://github.com/user-attachments/assets/0ab3aebf-6304-468e-8c90-84f39d8be89e">

