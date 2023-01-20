//
//  KakaoLocalMeetingModel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/18.
//

import Foundation

struct KakaoLocalMeetingModel: Decodable{
    let documents: [LocalMeetingResult]
}

struct LocalMeetingResult: Decodable{
    let road_address: MeetingRoadAddressResult
}

struct MeetingRoadAddressResult: Decodable{
    let address_name: String
    let building_name: String
}
