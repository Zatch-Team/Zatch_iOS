//
//  ZatchUtil.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/16.
//

import Foundation

struct Zatch{
    @frozen
    enum OpenState: Int{
        case open = 1
        case unopen = 2
    }
}

extension Zatch.OpenState{
    var title: String{
        switch self{
        case .unopen:   return "미개봉"
        case .open:     return "개봉"
        }
    }
}
