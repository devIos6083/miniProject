#  Destini - Choose Your Own Adventure Game
---

## Overview
* 이 앱은 사용자의 선택에 따라 이야기가 전개되는 "모험을 선택하는" 게임입니다. 
---

## Goal
* Implement the MVC Design Pattern: 모델, 뷰, 컨트롤러 컴포넌트를 명확하게 분리하여 코드의 조직과 관리를 용이하게 합니다.
* Utilize Swift Structures: Swift의 강력한 struct 기능을 활용하여 효율적으로 스토리 데이터를 모델링합니다.
* Interactive Storytelling: 사용자 선택에 따라 동적으로 UI를 업데이트하여 몰입감 있는 사용자 경험을 제공합니다.
---

## Project Structure

### Model

* Story 구조체는 제목과 두 가지 선택지를 포함한 하나의 스토리 노드를 나타냅니다.
* StoryBrain 구조체는 스토리 진행을 관리하고 현재 스토리를 가져오고 사용자 선택을 처리하는 메서드를 제공합니다.

```
struct Story {
    let title: String
    let choice1: String
    let choice1Destination: Int
    let choice2: String
    let choice2Destination: Int
}
```

### View

* 메인 인터페이스는 스토리 텍스트를 위한 UILabel과 사용자 선택을 위한 두 개의 UIButton 요소로 구성되어 있습니다.

### Controller

* 사용자 상호작용을 처리하고 스토리의 현재 상태에 따라 UI를 업데이트합니다.

```
class ViewController: UIViewController {
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceButton(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getStoryTitle()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}
```
---

## 완성된 화면

* 시작

<img width="294" alt="스크린샷 2024-08-06 오후 4 41 37" src="https://github.com/user-attachments/assets/4ec0e858-859e-41be-8515-e90c4d6c7c77">

* 버튼이 눌리고 스토리가 진행된 화면

<img width="296" alt="스크린샷 2024-08-06 오후 4 42 11" src="https://github.com/user-attachments/assets/0320c352-c64a-4ee5-850e-852f35e80004">




