//
//  ZatchResponseModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

struct ZatchResponseModel: Decodable{
    let anyZatch: Int
    let categoryId: Int
    let content: String
    let expirationDate: String
    let id: Int
    let isFree: Bool
    let isOpened: Int
    let itemName: String
    var likeCount: Int
    let purchaseDate: String
    let quantity: String
    let userId: Int
    //임시
    var isLike: Bool
    let images: [String]
    
    let p_first_category: Int?
    let p_first_name: String
    let p_second_category: Int?
    let p_second_name: String
    let p_third_category: Int?
    let p_third_name: String
}

extension ZatchResponseModel{
    var isSecondAndThirdPriorityEmpty: Bool{
        p_second_category == nil && p_third_category == nil
    }
}
