//
//  ZatchRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation
import Moya

enum ZatchRouter: BaseRouter{
    case likeZatch(requestValue: ZatchLikeRequestValue)
    case dislikeZatch(requestValue: ZatchLikeRequestValue)
    case registerZatch(requestModel: RegisterZatchRequestModel)
}

extension ZatchRouter{
    
    var path: String {
        switch self {
        case .likeZatch(let requestValue):           return HTTPMethodURL.POST.likeZatch + String(requestValue.zatchId) + "/likes"
        case .dislikeZatch(let requestValue):        return HTTPMethodURL.DELETE.dislikeZatch + String(requestValue.zatchId) + "/dislikes"
        case .registerZatch(let requestModel):      return HTTPMethodURL.POST.zatch
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .likeZatch, .registerZatch:    return .post
        case .dislikeZatch:                 return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .likeZatch, .dislikeZatch:         return .requestPlain
        case .registerZatch(let requestModel):  return .requestJSONEncodable(requestModel) //아마 multipart로 변경 필요
        }
    }
}


