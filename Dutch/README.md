#  더치페이 계산기 앱
---

## Our Goal

* 더치페이 계산기 앱은 사용자가 친구들과 쉽게 계산서를 나누고, 팁을 포함한 금액을 계산할 수 있도록 도와주는 간단하지만 강력한 도구입니다.
* 이 앱은 사용자가 총 계산 금액을 입력하고, 팁 비율을 선택하며, 계산서를 나눌 인원 수를 지정할 수 있게 합니다. 그 후, 각 사람이 지불해야 할 금액을 계산하여 깔끔한 인터페이스로 보여줍니다.
---

## What you will learn

* UIKit: 프로그래밍 방식으로 사용자 인터페이스를 구축하는 방법.
* Swift 프로그래밍: 함수와 메서드, 데이터 타입, 반복문, 변수의 범위, 오류 처리, 코드 리팩토링에 대해 학습합니다.
* ViewController 생명주기: 앱에서 뷰 컨트롤러를 관리하는 방법을 이해합니다.
* 기본 디버깅: 코드에서 버그를 식별하고 수정하는 방법을 배웁니다.
---

## 코드 구현

* CalculatorViewController

> 이 뷰 컨트롤러는 총 계산 금액, 팁 비율, 그리고 계산서를 나눌 인원 수를 입력받아 각 사람이 지불해야 할 금액을 계산하는 역할을 합니다.

```
import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // 팁 비율을 선택할 때 키보드를 닫습니다.
        billTextField.endEditing(true)
        
        // 모든 팁 버튼을 선택되지 않은 상태로 초기화합니다.
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // 선택된 버튼을 활성화합니다.
        sender.isSelected = true

        // 선택된 팁 비율을 가져옵니다.
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // 계산서를 나눌 인원 수를 업데이트합니다.
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        // 각 사람이 지불해야 할 총 금액을 계산합니다.
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        // 결과 화면으로 이동합니다.
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 계산된 결과를 ResultsViewController에 전달합니다.
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}
```

* ResultsViewController

> 이 뷰 컨트롤러는 계산된 금액을 사람 수와 선택한 팁 비율과 함께 표시합니다.

```
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 계산된 결과를 표시합니다.
        totalLabel.text = result
        settingLabel.text = "총 \(split)명이 팁 \(tip)%를 포함하여 나눠 내는 금액입니다."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        // 결과 화면을 닫고 계산기 화면으로 돌아갑니다.
        self.dismiss(animated: true, completion: nil)
    }
}
```
---

## 완성된 화면

> 첫 화면

<img width="319" alt="스크린샷 2024-08-12 오후 8 03 20" src="https://github.com/user-attachments/assets/628569fe-2381-4534-9525-d47f1fb9446c">

> 가격을 입력하고 완성된 화면 

<img width="325" alt="스크린샷 2024-08-12 오후 8 03 28" src="https://github.com/user-attachments/assets/6f9e7113-e2af-457d-98aa-3717a700c0f0">

