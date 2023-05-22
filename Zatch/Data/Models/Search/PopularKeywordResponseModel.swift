//
//  PopularKeywordResponseModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/22.
//

import Foundation

struct PopularKeywordsResponseModel: Decodable{
    let popularItem: [PopularKeywords]
}

struct PopularKeywords: Decodable{
    
    let keyword: String
    let likeCount: Int
    
    enum CodingKeys: String, CodingKey{
        case keyword = "md_name"
        case likeCount = "like_count"
    }
}
