//
//  LoginResponseModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation

struct LoginResponseModel: Decodable{
    
    enum CodingKeys: String, CodingKey{
        case email, name, nickname, token, isNewUser
        case userId = "user_id"
    }
    
    let email: String
    let name: String
    let nickname: String
    let token: String
    let userId: Int
    let isNewUser: Bool //임시
}
