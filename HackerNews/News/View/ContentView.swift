//
//  ContentView.swift
//  News
//
//  Created by 홍규강 on 8/25/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url), label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                )
            }
            .navigationTitle("Hacker News")
        } .onAppear{
            networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
/*
 networkManager로 변경이 관측될때마다 관측함
 Navigation / List로 각각 post 가져옴 / Navigation으려 연결해 / 위치는 DetailView가 목적지 / Hstack으로 post 좋아요 수 + 제목 / navigation제목 News -> onAppear로 데이터를 업데이트함
 */
