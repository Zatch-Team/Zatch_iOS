//
//  ZatchLikeViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxCocoa
import RxSwift

class ZatchLikeViewModel: BaseViewModel{
    
    private let likeUseCaseInterface: ZatchLikeUseCaseInterface
    private let dislikeUseCaseInterface: ZatchDislikeUseCaseInterface
    
    init(likeUseCaseInterface: ZatchLikeUseCaseInterface = ZatchLikeUseCase(),
         dislikeUseCaseInterface: ZatchDislikeUseCaseInterface = ZatchDisLikeUseCase()){
        self.likeUseCaseInterface = likeUseCaseInterface
        self.dislikeUseCaseInterface = dislikeUseCaseInterface
    }
    
    struct Input{
        let zatchId: Int
        let heartState: Bool
    }
    
    struct Output{
        let heartState: Observable<ZatchLikeResponseModel?>
    }
    
    
    func transform(_ input: Input) -> Output{
    
        let requestValue = ZatchLikeRequestValue(zatchId: input.zatchId)
        
        let response = Observable.just(input.heartState)
            .map{
                !$0
            }.flatMap{
                $0
                ? self.likeUseCaseInterface.execute(requestValue: requestValue)
                : self.dislikeUseCaseInterface.execute(requestValue: requestValue)
            }

        return Output(heartState: response)
    }
}
