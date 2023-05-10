//
//  ModifyNickNameUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/01.
//

import Foundation
import RxSwift

struct ModifyProfileRequestModel: Encodable{
    let newNickname: String
}

protocol ModifyProfileUseCaseInterface {
    func execute(requestValue: ModifyProfileRequestModel) -> Observable<Int>
}

final class ModifyProfileUseCase: ModifyProfileUseCaseInterface {
    
    private let userRepository: UserRepositoryInterface
    
    init(userRepository: UserRepositoryInterface = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute(requestValue: ModifyProfileRequestModel) -> Observable<Int> {
        return userRepository.modifyProfile(requestModel: requestValue)
    }
}
