//
//  SettingViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/30.
//

import Foundation
import RxSwift
import RxCocoa

class SettingViewModel: BaseViewModel{
    
    var chattingAlarmObservable: Observable<Bool>!
    
    private let logoutUseCase: LogoutUseCaseInterface
    
    init(logoutUseCase: LogoutUseCaseInterface = LogoutUseCase()){
        self.logoutUseCase = logoutUseCase
    }
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let logoutBtnTap: ControlEvent<Void>
    }
    
    struct Output{
        let logoutResponse: Driver<Int>
    }
    
    func transform(_ input: Input) -> Output{
        
        chattingAlarmObservable //임시
            .subscribe(onNext: {
            print("value check",$0)
        }).disposed(by: disposeBag)
        
        let logoutResponse = input.logoutBtnTap
            .flatMap{
                self.logoutUseCase.execute()
            }.asDriver(onErrorJustReturn: 404)
        
        return Output(logoutResponse: logoutResponse)
    }
}
