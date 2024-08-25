//
//  WebView.swift
//  News
//
//  Created by 홍규강 on 8/25/24.
//

import Foundation
import WebKit
import SwiftUI

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

/*
 urlString이 존재한다면 / makeUIView 함수 이용 -> WKWebView /
 updateUIView / safeString이 존재한다면 / url / request / uiView.load
 */
