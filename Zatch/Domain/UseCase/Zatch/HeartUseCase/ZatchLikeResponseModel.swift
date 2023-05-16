//
//  ZatchLikeResponseModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

struct ZatchLikeResponseModel: Decodable{
    let likeCount: Int
    let isLiked: Bool
}
