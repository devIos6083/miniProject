# Hacker-News
---

## Our Goal

* One of the most fundamental components of modern iOS apps is working with Lists (now known as Tables in UIKit).
* Lists are essential in various apps, from news feeds to messaging apps.
* It’s a crucial part of every iOS developer’s toolset.
* In this project, we’ll be mastering Lists using SwiftUI, creating custom cells, and working with networking to fetch data from the web. Get ready, it’s going to be a great learning experience!
---

## What you will create

* Hacker News is a news aggregator app that displays the latest articles from Hacker News.
* We will be using an API to fetch the latest news articles and display them in a list.
* Users can tap on any article to view it in a web browser.
---

## What you will learn

* How to use ObservableObject and @Published to manage and update data in SwiftUI.
* How to fetch data from the web using URLSession and handle JSON responses.
* How to display a list of data using List in SwiftUI and how to create custom cells.
* How to use NavigationLink to navigate between views in a SwiftUI app.
* How to embed SwiftUI views in a NavigationView for better navigation and structure.
* How to create reusable components in SwiftUI, like the WebView for displaying web pages.
* Learn about SwiftUI's data binding mechanisms, such as @ObservedObject and @State.
* How to handle optional values in Swift using if let and guard let.
* How to perform asynchronous operations and update the UI accordingly.
* How to leverage SwiftUI previews to test and iterate on your UI designs quickly.
---

## Clean code

> MVC - V

* ContentView

```
import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}
```

* DetailView

```
struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}
```

*  WebView

```
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
```


## Completion

> completed Screen

<img src="https://github.com/user-attachments/assets/f3cdcd91-70bb-41c5-af2b-46d45e4d33c7" width="200" height="400"/>
