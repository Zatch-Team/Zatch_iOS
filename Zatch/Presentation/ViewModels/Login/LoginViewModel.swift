//
//  LoginViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/29.
//

import Foundation
import RxSwift
import RxCocoa

final class LoginViewModel: BaseViewModel{
    
    private let loginUseCase: LoginUseCaseInterface
    
    init(loginUseCase: LoginUseCaseInterface = LoginUseCase()){
        self.loginUseCase = loginUseCase
    }
    
    struct Input{
        let email: String
        let name: String
    }
    
    struct Output{
        let loginResponse: Driver<LoginResponseModel?>
    }
    
    func transform(_ input: Input) -> Output {
        
        let response = loginUseCase.execute(
            requestValue: LoginRequestModel(email: input.email, name: input.name)
        ).do(onNext: {
            if let response = $0 {
                UserManager.token = response.token
                UserManager.userId = response.userId
                UserManager.nickName = response.nickname
            }
        }).asDriver(onErrorJustReturn: nil)
        
        return Output(loginResponse: response)
    }
}
