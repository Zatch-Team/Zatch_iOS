//
//  PlaceSearchRepsonseModel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/10.
//

import Foundation

struct PlaceSearchRepsonseModel: Decodable{
    let documents: [PlaceSearchModel]?
}

struct PlaceSearchModel: Decodable{
    let place_name: String
    let address_name: String
    let road_address_name: String
    let x: String
    let y: String
}
