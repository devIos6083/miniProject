//
//  PostData.swift
//  News
//
//  Created by 홍규강 on 8/25/24.
//

import Foundation

//MARK: - Results
/*
    클릭된 것 hits
*/
struct Results: Decodable {
    let hits: [Post]
}


//MARK: - Post
/*
    식별할 수 있고 / 읽을 수 있음
    id / objectID / points / title / url
 */

struct Post: Identifiable,Decodable {
    var id:  String  {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
