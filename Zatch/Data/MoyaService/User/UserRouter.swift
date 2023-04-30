//
//  UserRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation
import Moya

enum UserRouter: BaseRouter{
    case login(requestModel: LoginRequestModel)
    case logout
    case registerTown(requestModel: RegisterTownRequestModel)
}

extension UserRouter{
    
    var path: String {
        switch self {
        case .login:            return HTTPMethodURL.POST.login
        case .logout:           return HTTPMethodURL.GET.logout
        case .registerTown:     return HTTPMethodURL.POST.town + userIdPath + "/address"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .registerTown:     return .post
        case .logout:                   return .get
        }
    }
    
    var task: Task {
        switch self {
        case .login(let request):               return .requestJSONEncodable(request)
        case .registerTown(let request):        return .requestJSONEncodable(request)
        default:                                return .requestPlain
        }
    }
}


