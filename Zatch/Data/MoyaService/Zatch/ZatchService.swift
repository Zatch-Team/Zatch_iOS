//
//  ZatchService.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/11.
//

import Foundation

public class ZatchService {
    
    static let shared = ZatchService()
    let provider = BaseService(plugins: [MoyaLoggerPlugin()])
    
    private init() { }
    
    func registerZatch(requestModel: RegisterZatchRequestModel, images: [UIImage], completion: @escaping (Result<BaseResponseModel<Int>, Error>) -> Void){
        provider.requestDecoded(ZatchRouter.registerZatch(requestModel: requestModel, images: images)){ response in
            completion(response)
        }
    }
    
    func likeZatch(requestValue: ZatchLikeRequestValue, completion: @escaping (Result<ZatchLikeResponseModel, Error>) -> Void){
        provider.requestDecoded(ZatchRouter.likeZatch(requestValue: requestValue)){ response in
            completion(response)
        }
    }
    
    func dislikeZatch(requestValue: ZatchLikeRequestValue, completion: @escaping (Result<ZatchLikeResponseModel, Error>) -> Void){
        provider.requestDecoded(ZatchRouter.dislikeZatch(requestValue: requestValue)){ response in
            completion(response)
        }
    }
}
