//
//  UserRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation
import Moya

enum UserRouter: BaseRouter{
    case login(requestMode: LoginRequestModel)
}

extension UserRouter{
    
    var path: String {
        switch self {
        case .login:
            return HTTPMethodURL.POST.login
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:    return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let request):       return .requestJSONEncodable(request)
        }
    }
}


