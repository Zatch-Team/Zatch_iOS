//
//  HeartZatchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation

struct HeartZatchRequestValue {
    let id: Int
    let isHeart: Bool
}

protocol HeartZatchUseCaseInterface {
    func execute(requestValue: HeartZatchRequestValue) async throws
}

final class HeartZatchUseCase: HeartZatchUseCaseInterface {

    private let zatchRepository: ZatchRepositoryInterface

    init(zatchRepository: ZatchRepositoryInterface = ZatchRepository()) {
        self.zatchRepository = zatchRepository
    }

    func execute(requestValue: HeartZatchRequestValue) async throws {
        return try await zatchRepository.fetchHeartState()
    }
}
