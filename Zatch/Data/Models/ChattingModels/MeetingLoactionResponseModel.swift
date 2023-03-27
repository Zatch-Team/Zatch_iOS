//
//  MeetingLoactionResponseModel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import Foundation

struct MeetingLoactionResponseModel: Decodable{
    let documents: [MeetingLocationModel]
}

struct MeetingLocationModel: Decodable{
    let road_address: RoadAddressModel
}

struct RoadAddressModel: Decodable{
    let address_name: String
    let building_name: String
}
