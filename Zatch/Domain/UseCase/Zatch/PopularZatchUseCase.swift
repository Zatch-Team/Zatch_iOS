//
//  PopularZatchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation

struct PopularZatchRequestValue {
    
}

protocol PopularZatchUseCaseInterface {
    func execute(requestValue: PopularZatchRequestValue) async throws
}

final class PopularZatchUseCase: PopularZatchUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: PopularZatchRequestValue) async throws {
        return try await zatchRepository.getPopularZatch()
    }
}
