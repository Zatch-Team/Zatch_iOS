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
        static let placeSearch = kakaoLocal + "/search/keyword.json"
        static let townLocation = kakaoLocal + "/geo/coord2regioncode.json"
        static let meetingLocation = kakaoLocal + "/geo/coord2address.json"
        
        //USER
        static let logout = user + "/logout"
    }
    
    struct POST {
        //USER
        static let login = user + "/new"
        static let town = user
    }
    
    struct PUT {
    }
    
    struct DELETE {
    }
    
    
}
