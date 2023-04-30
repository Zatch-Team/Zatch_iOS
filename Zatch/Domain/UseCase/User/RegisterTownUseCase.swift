//
//  RegisterTownUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation
import RxSwift

struct RegisterTownRequestModel: Encodable{
    
    enum CodingKeys: String, CodingKey{
        case townName = "addr_name"
        case x = "addr_x"
        case y = "addr_y"
    }

    let townName: String
    let x: String
    let y: String
}

protocol RegisterTownUseCaseInterface {
    func execute(requestValue: RegisterTownRequestModel) -> Observable<Int>
}

final class RegisterTownUseCase: RegisterTownUseCaseInterface {
    
    private let userRepository: UserRepositoryInterface
    
    init(userRepository: UserRepositoryInterface = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute(requestValue: RegisterTownRequestModel) -> Observable<Int> {
        return userRepository.registerTown(requestModel: requestValue)
    }
}
