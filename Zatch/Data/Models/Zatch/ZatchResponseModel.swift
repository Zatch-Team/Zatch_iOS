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
    let quantity: Int
    let userId: Int
    //임시
    var isLike: Bool
}
