//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - viewWillAppear
    /*
    우선 슈퍼 객체로 올라가고
    네비게이션 바가 사라져야돼
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    //MARK: - viewWillDisappear
    /*
    우선 슈퍼 객체로 올라가고
    네비게이션 바가 보여야돼
    */

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    //MARK: - viewDidLoad
    /*
    Title 초기화
    charIndex / titleText /
    letter로 한글자씩 꺼내면서 -> 인덱스에 따라 0.1초씩 -> 타이틀에 추가
    인덱스 이동
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = K.appName
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }

       
    }

}
