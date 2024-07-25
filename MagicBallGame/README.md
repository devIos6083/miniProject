## 앱 이름 : Magic 8 Ball
---

## 만들고자 하는 것
* Magic 8 Ball
* 전 mini project였던 dice game을 더 업그레이드 시킴
---

## 무엇을 배웠느냐
* Github에서 Asset이 저장된 Xcode starter project 가져왔음.
* the Interface Builder 파일들과 code 사이에 using IBActions and IBOutlets을 사용하여 link 시킴.
* To generate random numbers in Swift
---

## 코드
'''swift
import UIKit

class ViewController: UIViewController {

    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    @IBOutlet weak var imageView: UIImageView!

    @IBAction func askButtonPressed(_ sender: UIButton) {
        imageView.image = ballArray[Int.random(in: 0...4)]
    }

}
'''
---

## 완성
* 초기 화면  
<img width="328" alt="스크린샷 2024-07-25 오후 5 09 17" src="https://github.com/user-attachments/assets/1f19a0b5-8c6a-44de-b0ec-0ee59abbe6bf">


* 버튼이 클릭된 후 화면
<img width="335" alt="스크린샷 2024-07-25 오후 5 09 25" src="https://github.com/user-attachments/assets/a00eff64-7cc7-4113-9d46-2a7a4d195617">
