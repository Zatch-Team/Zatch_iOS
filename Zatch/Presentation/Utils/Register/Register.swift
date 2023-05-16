//
//  Register.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/11.
//

import Foundation

struct Zatch{
    @frozen
    enum OpenState: Int{
        case open = 1
        case unopen = 2
    }
}

struct Register{
    
    @frozen
    enum ProductDate: String{
        case buy = "구매일자"
        case end = "유통기한"
    }
    
    @frozen
    enum WantZatch: Int{
        case onlyRegister = 0
        case anyZatch = 1
    }
    
    typealias DateString = (year: String, month: String, date: String)
}

extension Zatch.OpenState{
    var title: String{
        switch self{
        case .unopen:   return "미개봉"
        case .open:     return "개봉"
        }
    }
}
