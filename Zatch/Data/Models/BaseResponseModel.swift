//
//  BaseResponseModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/05.
//

import Foundation

struct BaseResponseModel<T: Decodable>: Decodable{
    let success: Bool
    let httpCode: Int
    let errorCode: String?
    let localDateTime: String
    let httpStatus: String
    let message: String
    let data: T?
}
