//
//  ChattingMemberResponseDTO.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/29.
//

import Foundation

struct ChattingMemberResponseDTO: Decodable{
    let userId: Int
    let name: String
    let profileImageUrl: String
}

extension ChattingMemberResponseDTO{
    func toDomain() -> ChattingMember {
        return ChattingMember(
            userId: userId,
            name: name,
            profileImageUrl: profileImageUrl
        )
    }
}
