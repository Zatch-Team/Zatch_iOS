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
    
    let firstPriorityCategory: Int?
    let firstPriorityItem: String
    let secondPriorityCategory: Int?
    let secondPriorityItem: String
    let thirdPriorityCategory: Int?
    let thirdPriorityItem: String
    
    enum CodingKeys: String, CodingKey {
        case anyZatch
        case categoryId
        case content
        case expirationDate
        case id
        case isFree
        case isOpened
        case itemName
        case likeCount
        case purchaseDate
        case quantity
        case userId
        case isLike
        case images
        case firstPriorityCategory = "p_first_category"
        case firstPriorityItem = "p_first_name"
        case secondPriorityCategory = "p_second_category"
        case secondPriorityItem = "p_second_name"
        case thirdPriorityCategory = "p_third_category"
        case thirdPriorityItem = "p_third_name"
    }
}

extension ZatchResponseModel{
    var isSecondAndThirdPriorityEmpty: Bool{
        secondPriorityCategory == nil && thirdPriorityCategory == nil
    }
}
