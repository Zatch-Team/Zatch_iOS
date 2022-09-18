//
//  KakaoLocalModel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/10.
//

import Foundation

struct KakaoLocalTownModel: Decodable{
    let documents: [LocalTownResult]?
}

struct LocalTownResult: Decodable{
    let place_name: String
    let address_name: String
    let road_address_name: String
    let x: String
    let y: String
}
