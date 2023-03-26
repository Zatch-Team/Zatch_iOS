//
//  HTTPMethodURL.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/05.
//

import Foundation

enum HTTPMethodURL {
    
    static let user = "/users"
    static let kakaoLocal = "/v2/local"
    
    struct GET {
        //KAKAO LOCAL
        static let placeSearch = "/search/keyword.json"
        static let townLocation = "/geo/coord2regioncode.json"
        static let meetingLocation = "/geo/coord2address.json"
    }
    
    struct POST {
    }
    
    struct PUT {
    }
    
    struct DELETE {
    }
    
    
}
