//
//  LoginUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation
import RxSwift

struct LoginRequestModel: Encodable{
    let email: String
    let name: String
}

protocol LoginUseCaseInterface {
    func execute(requestValue: LoginRequestModel) -> Observable<LoginResponseModel?>
}

final class LoginUseCase: LoginUseCaseInterface {
    
    private let userRepository: UserRepositoryInterface
    
    init(userRepository: UserRepositoryInterface = UserRepository()) {
        self.userRepository = userRepository
    }
    
    func execute(requestValue: LoginRequestModel) -> Observable<LoginResponseModel?> {
        return userRepository.login(requestModel: requestValue)
    }
}
