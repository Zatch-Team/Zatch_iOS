//
//  GetMyZatchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/19.
//

import Foundation

struct GetRegisterZatchRequestValue {
    
}

protocol GetRegisterZatchUseCaseInterface {
    func execute(requestValue: GetRegisterZatchRequestValue) async throws
}

final class GetRegisterZatchUseCase: GetRegisterZatchUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: GetRegisterZatchRequestValue) async throws {
        return try await zatchRepository.getRegisterZatch()
    }
}
