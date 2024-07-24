## 앱 이름 : Dicee 게임
---

## 만들고자 하는 것
* Las Vegas dice app
* 버튼을 누르거나 핸드폰을 흔드는 경우 랜덤으로 주사위가 변하는 것을 볼 수 있음.
---

## 무엇을 배웠느냐
* Github에서 Asset이 저장된 Xcode starter project 가져왔음.
* the Interface Builder 파일들과 code 사이에 using IBActions and IBOutlets을 사용하여 link 시킴.
* Swift constants, variables and collection types들을 사용하여 코드를 작성함.
* To generate random numbers in Swift
---

## 코드
'''
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!


    @IBAction func rollButtonPressed(_ sender: UIButton) {

        let diceArray = [
            UIImage(imageLiteralResourceName: "DiceOne"),
            UIImage(imageLiteralResourceName: "DiceTwo"),
            UIImage(imageLiteralResourceName: "DiceThree"),
            UIImage(imageLiteralResourceName: "DiceFour"),
            UIImage(imageLiteralResourceName: "DiceFive"),
            UIImage(imageLiteralResourceName: "DiceSix")
        ]

        diceImageView1.image = diceArray[Int.random(in: 0...5)]
        diceImageView2.image = diceArray[Int.random(in: 0...5)]

    }

}
'''
---

## 완성
* 초기 화면  
<img width="329" alt="스크린샷 2024-07-24 오후 4 53 45" src="https://github.com/user-attachments/assets/40694d6f-1ec3-4780-87d8-fe6955daad24">

* 버튼이 클릭된 후 화면
<img width="345" alt="스크린샷 2024-07-24 오후 4 53 26" src="https://github.com/user-attachments/assets/4054e73f-cb84-4ed5-aec3-e4eb2b8c2232">
