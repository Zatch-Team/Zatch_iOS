//
//  HTTPMethodURL.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/05.
//

import Foundation

enum HTTPMethodURL {

    static let zatchUrl = "/zatch"
    static let searchUrl = "/search"
    static let userUrl = "/users"
    static let chatUrl = "/chat"
    static let blockUrl = "/block"
    static let reportUrl = "/report"
    static let kakaoLocal = "/v2/local"
    
    struct GET {
        //KAKAO LOCAL
        static let placeSearch = kakaoLocal + "/search/keyword.json"
        static let townLocation = kakaoLocal + "/geo/coord2regioncode.json"
        static let meetingLocation = kakaoLocal + "/geo/coord2address.json"
        
        //USER
        static let logout = userUrl + "/logout"
        static let block = blockUrl + "/list"
        
        //CHAT
        static let openChatRoom = chatUrl
        static let existChattingRoom = chatUrl + "/chat_list"
        static let chattingRoomMemebers = chatUrl
        static let exitChattingRoom = chatUrl + "/chat_out" //TODO: 서버 문의 필요
        static let afterDeal = chatUrl + "/after_deal"
        
        //SEARCH
        static let popularKeywords = zatchUrl + searchUrl + "/popularItem"
        
    }
    
    struct POST {
        //USER
        static let login = userUrl + "/new"
        static let town = userUrl
        static let likeZatch = zatch
        static let zatch = zatchUrl
        static let block = blockUrl
        static let report = reportUrl
        
        //CHAT
        static let generateChatRoom = chatUrl
    }
    
    struct PATCH {
        static let profileImage = userUrl
        static let nickname = userUrl
    }
    
    struct DELETE {
        static let dislikeZatch = zatchUrl
    }
    
    
}
