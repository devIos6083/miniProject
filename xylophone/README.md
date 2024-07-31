## 앱 이름 : Xylophone
---

## 만들고자 하는 것
*  an Apple library called AVFoundation를 사용해서 소리를 작동시킴.
* The most important skill of a great programmer is being able to solve your own problems.
* We’ll do that by exploring StackOverflow, Apple Documentation and learning how to search for solutions effectively.
* 첫번째 musical instrument를 사용한 music apps
* coloful한 실로폰 앱을 만들고자
---

## What you will create
You will be making your first musical instrument! Music apps are so popular on the App Store that they even get their own category. So in this module, we’re going to make a colorful XyloPhone app. Get it? Ok, the jokes are bad, but remember, I only wrote the good ones...
---

## What you will learn
* AVFoundation and AVAudioPlayer을 사용해서 사운드 작동법에 대해 배움.
* Apple documentation을 이해하고 StackOverflow를 사용하는 방법에 대해 학습함.
* Functions and methods in Swift.
* Data types.
* Swift loops.
* Variable scope.
* The ViewController lifecycle.
* Error handling in Swift.
* Code refactoring.
* Basic debugging.
---

## Code
```
import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func keyPressed(_ sender: UIButton) {

        playSound(soundName: sender.currentTitle!)

        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5

        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0
        }

    }

    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()

    }

}
```
---

## 완성
<img width="310" alt="스크린샷 2024-07-31 오후 4 48 42" src="https://github.com/user-attachments/assets/491b40f2-f65a-4f6b-80fe-34ece68b205d">
---
