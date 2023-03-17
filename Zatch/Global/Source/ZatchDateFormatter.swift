//
//  ZatchDateFormatter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/06.
//

import Foundation

struct ZatchDateFormatter{
    static let baseFormatter = DateFormatter().then{
        $0.dateFormat = "yyyy.MM.dd"
    }
}
