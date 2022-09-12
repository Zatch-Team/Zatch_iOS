//
//  Const.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/29.
//

import Foundation

class Const{
    static let deviceWidth = UIScreen.main.bounds.size.width
    static let deviceHeight = UIScreen.main.bounds.size.height
    
    class KakaoAPI{
        static let KAKAO_APP_KEY: String = Bundle.main.object(forInfoDictionaryKey: "KAKAO_APP_KEY") as! String
        
        static let KAKAO_REST_API_KEY: String = Bundle.main.object(forInfoDictionaryKey: "KAKAO_REST_API_KEY") as! String
    }
}
