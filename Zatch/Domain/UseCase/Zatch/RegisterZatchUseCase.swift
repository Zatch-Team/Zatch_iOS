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
    
    let userId: Int = UserManager.userId!
    let categoryId: Int
    let anyZatch: Int
    let content: String
    let expirationDate: String?
    let isFree: Bool
    let isOpened: Int
    let itemName: String
    let purchaseDate: String?
    let quantity: String?
    
    let p_first_category: Int?
    let p_first_name: String
    let p_second_category: Int?
    let p_second_name: String
    let p_third_category: Int?
    let p_third_name: String
}

protocol RegisterUseCaseInterface {
    func execute(requestValue: RegisterZatchDTO) -> Observable<ResponseState>
}

final class RegisterUseCase: RegisterUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: RegisterZatchDTO) -> Observable<ResponseState>{
        return zatchRepository.registerZatch(requestModel: requestValue)
    }
}
