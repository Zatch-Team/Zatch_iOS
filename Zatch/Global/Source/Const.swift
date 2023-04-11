//
//  Const.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/29.
//

import Foundation

struct Const{
    static let isSmallDevice = height <= 736
    struct KakaoAPI{
        static let KAKAO_APP_KEY: String = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as! String
        static let KAKAO_REST_API_KEY: String = Bundle.main.object(forInfoDictionaryKey: "KAKAO_REST_API_KEY") as! String
    }
    
    struct Offset{
        static let TOP_OFFSET = 107 //navigationView 고려한 top offset
        static let headerTop = 47
    }
    
    struct Constraint{
        static let navigationViewTopOffset: CGFloat = 47
        static let mainViewTopOffset: CGFloat = 107
        static let profileImageSize: CGFloat = 116
    }
}


struct Device{
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
}

struct ViewTag{
    static let normal = 1
    static let select = 2
    static let deselect = 3
}
