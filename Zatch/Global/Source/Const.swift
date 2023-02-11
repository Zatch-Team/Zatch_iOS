//
//  Const.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/29.
//

import Foundation

struct Const{
    
    struct Device{
        static let DEVICE_WIDTH = UIScreen.main.bounds.size.width
        static let DEVICE_HEIGHT = UIScreen.main.bounds.size.height
    }
    
    struct KakaoAPI{
        static let KAKAO_APP_KEY: String = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as! String
        static let KAKAO_REST_API_KEY: String = Bundle.main.object(forInfoDictionaryKey: "KAKAO_REST_API_KEY") as! String
    }
    
    struct Offset{
        static let TOP_OFFSET = 107 //navigationView 고려한 top offset
        static let headerTop = 47
    }
}

struct ViewTag{
    static let normal = 1
    static let select = 2
    static let deselect = 3
}
