//
//  LogoutUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/30.
//

import Foundation
import RxSwift

protocol LogoutUseCaseInterface {
    func execute() -> Observable<Int>
}

final class LogoutUseCase: LogoutUseCaseInterface {
    
    private let userRepository: UserRepositoryInterface
    
    init(userRepository: UserRepositoryInterface = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute() -> Observable<Int> {
        return userRepository.logout()
    }
}
