//
//  ZatchDislikeUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/10.
//

import Foundation
import RxSwift

protocol ZatchDislikeUseCaseInterface {
    func execute(requestValue: ZatchLikeRequestValue) -> Observable<ZatchLikeResponseModel?>
}

final class ZatchDisLikeUseCase: ZatchDislikeUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: ZatchLikeRequestValue) -> Observable<ZatchLikeResponseModel?>{
        return zatchRepository.dislikeZatch(requestValue: requestValue)
    }
}
