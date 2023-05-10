//
//  ModifyProfileImageUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/01.
//

import Foundation
import RxSwift

protocol ModifyProfileImageUseCaseInterface {
    func execute(requestValue: UIImage) -> Observable<Int>
}

final class ModifyProfileImageUseCase: ModifyProfileImageUseCaseInterface {
    
    private let userRepository: UserRepositoryInterface
    
    init(userRepository: UserRepositoryInterface = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute(requestValue: UIImage) -> Observable<Int> {
        return userRepository.modifyProfileImage(request: requestValue)
    }
}
