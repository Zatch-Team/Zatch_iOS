//
//  KakaoLocalModel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/10.
//

import Foundation

struct KakaoLocalModel: Decodable{
    let documents: [LocalResult]?
}

struct LocalResult: Decodable{
    let place_name: String
    let address_name: String
    let road_address_name: String
    let x: String
    let y: String
}
