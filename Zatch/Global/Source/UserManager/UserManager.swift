//
//  UserManager.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation

class UserManager {
    @UserDefault(key: UserDefaultKey.userId, defaultValue: nil)
    static var userId: Int?
    
    @UserDefault(key: UserDefaultKey.token, defaultValue: nil)
    static var token: String?
    
    @UserDefault(key: UserDefaultKey.nickName, defaultValue: nil)
    static var nickName: String?
}
