//
//  AroundZatchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation

struct AroundZatchRequestValue {
    
}

protocol AroundZatchUseCaseInterface {
    func execute(requestValue: AroundZatchRequestValue) async throws
}

final class AroundZatchUseCase: AroundZatchUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: AroundZatchRequestValue) async throws {
        return try await zatchRepository.getAroundZatch()
    }
}
