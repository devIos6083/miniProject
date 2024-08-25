//
//  DetailView.swift
//  News
//
//  Created by 홍규강 on 8/25/24.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
 

}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
/*
 url 이 존재한다면/ Webview
 */
