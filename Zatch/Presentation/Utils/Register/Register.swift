//
//  Register.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/11.
//

import Foundation

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
