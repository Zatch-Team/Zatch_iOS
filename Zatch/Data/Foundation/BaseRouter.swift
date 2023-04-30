//
//  BaseRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/05.
//

import Foundation
import Moya

protocol BaseRouter: Moya.TargetType {
}

extension BaseRouter {
    
    var userIdPath: String{
        guard let userId = UserManager.userId else { return "" }
        return "/\(userId)"
    }

    var baseURL: URL {
        let url = Bundle.main.infoDictionary?["Zatch_API_URL"] as? String ?? ""
        return URL(string: "http://" + url)!
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "ACCESS-TOKEN": UserManager.token ?? ""
        ]
    }

    var sampleData: Data {
        return Data()
    }

}
