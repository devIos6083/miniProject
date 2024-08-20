# Flash-Chat
---

## Our Goal

* One of the most fundamental component of modern iOS apps is the Table View. 
* Table Views are used everywhere from the Mail app to the Messages app. 
* It’s a crucial part of every iOS developer’s tool belt. 
* In this tutorial we’ll be getting to grips with Table Views, creating custom cells, and making our own cloud-based backend database. It’s going to be epic, so buckle up.
---

## What you will create

* Flash Chat is an internet based messaging app similar to WhatsApp, the popular messaging app that was bought by Facebook for $22 billion.
* We will be using a service called Firebase Firestore as a backend database to store and retrieve our messages from the cloud. 
---

## What you will learn

* How to integrate third party libraries in your app using Swift Package Manager.
* How to store data in the cloud using Firebase Firestore.
* How to query and sort the Firebase database.
* How to use Firebase for user authentication, registration and login.
* How to work with UITableViews and how to set their data sources and delegates.
* How to create custom views using .xib files to modify native design components.
* How to embed View Controllers in a Navigation Controller and understand the navigation stack.
* How to create a constants file and use static properties to store Strings and other constants.
* Learn about Swift loops and create animations using loops.
* Learn about the App Lifecycle and how to use viewWillAppear or viewWillDisappear.
* How to create direct Segues for navigation.
---

## Core code

> MVC - C

* Welcome Controller

```
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
```



## Completion

> completed Screen

* enter the app

<img src="https://github.com/user-attachments/assets/f9a60148-54c6-444d-a977-58df4dca5705" width="200" height="400"/>

* connect view controllers

<img src="https://github.com/user-attachments/assets/c21f877e-b850-4e2a-b59e-b1980045c53a" width="200" height="400"/>

* 채팅까지 구현된 모습

<img src="https://github.com/user-attachments/assets/ea828ad6-dd4b-47c3-a48f-641bc09e4c4b" width="200" height="400"/>

* 완성 - 로그아웃까지

<img src="https://github.com/user-attachments/assets/01600d3d-a985-46b5-bc20-245c575e052c" width="200" height="400"/>
