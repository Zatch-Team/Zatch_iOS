//
//  LookingForZatchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/19.
//

import Foundation

struct LookingForZatchRequestValue {
    
}

protocol LookingForZatchUseCaseInterface {
    func execute(requestValue: LookingForZatchRequestValue) async throws
}

final class LookingForZatchUseCase: LookingForZatchUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: LookingForZatchRequestValue) async throws {
        return try await zatchRepository.getLookingForZatch()
    }
}
