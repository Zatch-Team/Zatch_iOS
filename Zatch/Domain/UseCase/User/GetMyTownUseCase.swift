//
//  GetMyTownUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/18.
//

import Foundation

struct GetMyTownRequestValue {
    
}

protocol GetMyTownUseCaseInterface {
    func execute(requestValue: GetMyTownRequestValue) async throws
}

final class GetMyTownUseCase: GetMyTownUseCaseInterface {

    private let userRepository: UserRepositoryInterface

    init(userRepository: UserRepositoryInterface = UserRepository()) {
        self.userRepository = userRepository
    }

    func execute(requestValue: GetMyTownRequestValue) async throws {
        return try await userRepository.getMyTowns()
    }
}
