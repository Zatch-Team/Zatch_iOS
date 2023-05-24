//
//  ZatchRepositoryInterface.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation
import RxSwift

protocol ZatchRepositoryInterface {
    func registerZatch(requestModel: RegisterZatchDTO) -> Observable<ResponseState>
    func getPopularZatch()
    func getAroundZatch()
    func likeZatch(requestValue: ZatchLikeRequestValue) -> Observable<ZatchLikeResponseModel?>
    func dislikeZatch(requestValue: ZatchLikeRequestValue)  -> Observable<ZatchLikeResponseModel?>
    func getRegisterZatch()
    func getLookingForZatch()
}

