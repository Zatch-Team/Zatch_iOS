//
//  ZatchRepository.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation
import RxSwift

final class ZatchRepository: ZatchRepositoryInterface {
    
    func registerZatch() {

    }
    
    func getRegisterZatch() {
        
    }
    
    func getLookingForZatch() {
        
    }
    
    func getPopularZatch(){
        
    }
    
    func getAroundZatch(){
        
    }
    
    func likeZatch(requestValue: ZatchLikeRequestValue) -> Observable<ZatchLikeResponseModel?> {
        let observable = Observable<ZatchLikeResponseModel?>.create { observer -> Disposable in
            let requestReference: () = ZatchService.shared.likeZatch(requestValue: requestValue){ response in
                switch response {
                case .success(let data):
                    observer.onNext(data)
                case .failure(let err):
                    print(err)
                    observer.onNext(nil)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
    
    func dislikeZatch(requestValue: ZatchLikeRequestValue) -> Observable<ZatchLikeResponseModel?> {
        let observable = Observable<ZatchLikeResponseModel?>.create { observer -> Disposable in
            let requestReference: () = ZatchService.shared.dislikeZatch(requestValue: requestValue){ response in
                switch response {
                case .success(let data):
                    observer.onNext(data)
                case .failure(let err):
                    print(err)
                    observer.onNext(nil)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
    
    
}
