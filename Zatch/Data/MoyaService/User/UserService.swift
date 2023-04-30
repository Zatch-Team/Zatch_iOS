//
//  UserService.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation

public class UserService {
    
    static let shared = UserService()
    let provider = BaseService(plugins: [MoyaLoggerPlugin()])
    
    private init() { }
    
    func login(request: LoginRequestModel, completion: @escaping (Result<LoginResponseModel, Error>) -> Void){
        provider.requestDecoded(UserRouter.login(requestModel: request)){ response in
            completion(response)
        }
    }
    
    func logout(completion: @escaping (Result<Int, Error>) -> Void){
        provider.requestDecoded(UserRouter.logout){ response in
            completion(response)
        }
    }
    
    func registerTown(request: RegisterTownRequestModel, completion: @escaping (Result<LoginResponseModel, Error>) -> Void){
        provider.requestDecoded(UserRouter.registerTown(requestModel: request)){ response in
            completion(response)
        }
    }
}
