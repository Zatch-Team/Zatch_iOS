//
//  SearchRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/22.
//

import Foundation
import Moya

enum SearchRouter: BaseRouter{
    case getPopularKeywords
}

extension SearchRouter{
    
    var path: String {
        switch self {
        case .getPopularKeywords:       return HTTPMethodURL.GET.popularKeywords
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPopularKeywords:       return .get
        }
    }
    
    var task: Task {
        switch self{
        case .getPopularKeywords:       return .requestPlain
        }
    }
}


