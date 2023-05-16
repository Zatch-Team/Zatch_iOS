//
//  ZatchLikeRequestValue.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/10.
//

import Foundation

struct ZatchLikeRequestValue {
    let zatchId: Int
    let userId: Int = UserManager.userId ?? 0
}
