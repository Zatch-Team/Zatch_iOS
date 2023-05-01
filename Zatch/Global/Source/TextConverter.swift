//
//  TextConverter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/01.
//

import Foundation

class TextConverter{
    static func getValidateRangeString(_ value: String, limit: Int) -> String{
        let endIndex = min(limit, value.count)
        let endStringIndex = value.index(value.startIndex, offsetBy: endIndex)
        return String(value[..<endStringIndex])
    }
}
