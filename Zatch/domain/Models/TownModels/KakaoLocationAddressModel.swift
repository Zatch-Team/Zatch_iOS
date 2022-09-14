//
//  KakaoLocationAddressModel.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/14.
//

import Foundation

struct KakaoLocationAddressModel: Decodable{
    let address_name: String
    let region_1depth_name: String
    let region_2depth_name: String
    let region_3depth_name: String
}
