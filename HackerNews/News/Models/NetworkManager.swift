//
//  NetworkManager.swift
//  News
//
//  Created by 홍규강 on 8/25/24.
//

import Foundation

//MARK: - NetworkManager(관측이 가능해야돼)
/*
    posts로 데이터 가져오고
    //MARK: - fetchData
 /*
  url 이 존재한다면 -> session -> task -> error없으면 -> decoder -> safeData가 존재하면 -> results Result 해독해서 가져와 -> 비동기로
  에러가 있는 경우는 출력해 -> task 재개하기
  */
 */

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url  = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let result = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
