//
//  RegisterZatchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/10.
//

import Foundation
import RxSwift

struct RegisterZatchDTO{
    let info: RegisterZatchRequestModel
    let images: [UIImage]
}

struct RegisterZatchRequestModel: Encodable {
    
    struct WantProductPriority: Encodable{
        let priority: Int
        let p_name: String
        let p_category: Int
    }
    
    let anyZatch: Int
    let categoryId: Int
    let content: String
    let expirationDate: String?
    let isFree: Bool
    let isOpened: Int
    let itemName: String
    let purchaseDate: String?
    let quantity: String?
    let priorites: [WantProductPriority]
    let userId: Int
}

protocol RegisterUseCaseInterface {
    func execute(requestValue: RegisterZatchDTO) -> Observable<RequestResponse>
}

final class RegisterUseCase: RegisterUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: RegisterZatchDTO) -> Observable<RequestResponse>{
        return zatchRepository.registerZatch(requestModel: requestValue)
    }
}
