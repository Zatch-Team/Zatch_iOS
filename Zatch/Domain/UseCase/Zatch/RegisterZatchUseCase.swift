//
//  RegisterZatchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/10.
//

import Foundation

struct RegisterZatchRequestModel {
    
    struct PriorityProduct{
        let priority: Int
        let productName: String
        let categoryId: Int
    }
    
    let anyZatch: Int
    let categoryId: Int
    let content: String
    let expirationDate: String
    let isFree: Bool
    let isOpened: Int
    let itemName: String
    let purchaseDate: String
    let quantity: String
    let priorites: [PriorityProduct] //임시 설정
    let userId: Int
}

protocol RegisterUseCaseInterface {
    func execute(requestValue: RegisterZatchRequestModel) async throws
}

final class RegisterUseCase: RegisterUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: RegisterZatchRequestModel) async throws {
        return try await zatchRepository.registerZatch()
    }
}
