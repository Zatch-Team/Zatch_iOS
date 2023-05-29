//
//  ChattingMember.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/29.
//

import Foundation

struct ChattingMember{
    let userId: Int
    let name: String
    let profileImageUrl: String
}

extension ChattingMember{
    var isMe: Bool{
        userId == UserManager.userId
    }
}
