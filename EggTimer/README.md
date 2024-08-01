# Egg Timer
---

## 목표 
* 이 앱은 계란의 익힘 정도에 따라 타이머를 설정하고, 시간이 다 되면 신호음을 울려주는 기능을 제공합니다.
---

## 사용된 기술 스택
* Swift Collection types - Dictionaries
* The Swift Timer API
* Conditional statements - IF/ELSE
* Conditional statements - Switch
* Functions with outputs
* How to use the ProgressView
---

## 코드 설명
```
import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes = ["Soft" : 3,"Medium" : 5,"Hard" : 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    var totalTime = 0
    var secondsPassed = 0
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if (secondsPassed < totalTime) {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
    
}
```
---
# 결과물

## 초기 화면

<img width="354" alt="스크린샷 2024-08-01 오후 7 57 44" src="https://github.com/user-attachments/assets/d3c29c96-d800-4a36-bd95-141a46aeb9ef">

## Soft 버튼이 눌린 화면

<img width="370" alt="스크린샷 2024-08-01 오후 7 57 31" src="https://github.com/user-attachments/assets/995864fb-f28f-44e9-b5ef-3c616fabbe1a">

## 계란이 다 구워진 후 화면

<img width="403" alt="스크린샷 2024-08-01 오후 7 57 26" src="https://github.com/user-attachments/assets/3d362d88-772f-422b-8bcf-75440690a1bf">
---

# 사용 방법
1) 앱을 실행합니다.
2) 익히고자 하는 계란의 익힘 정도(Soft, Medium, Hard)를 선택합니다.
3) ProgressBar가 진행되며, 선택한 시간에 맞추어 신호음이 울립니다.
4) 타이머가 완료되면 화면에 "Done"이 표시됩니다.



