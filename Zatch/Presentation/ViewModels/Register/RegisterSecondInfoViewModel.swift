//
//  RegisterSecondInfoViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/12.
//

import Foundation
import RxSwift
import RxCocoa

struct RegisterSecondInformationDTO{
    let firstPriorityCategory: Int?
    let firstPriorityName: String
    let secondPriorityCategory: Int?
    let secondPriorityName: String
    let thirdPriorityCategory: Int?
    let thirdPriorityName: String
    let anyZatch: Int
    let isFree: Bool
}

class RegisterSecondInfoViewModel: BaseViewModel{
    
    private typealias RequestObservableType = (firstCategory: Int?,
                                               firstProductName: String,
                                               secondCategory: Int?,
                                               secondProductName: String,
                                               thirdCategory: Int?,
                                               thirdProductName: String,
                                               wantType: Register.WantZatch)
    
    struct Input{
        let firstPriorityCategory: Observable<Int?>
        let firstProductName: Observable<String>
        let secondPriorityCategory: Observable<Int?>
        let secondProductName: Observable<String>
        let thirdPriorityCategory: Observable<Int?>
        let thirdProductName: Observable<String>
        let wantProductType: Observable<Register.WantZatch>
        let shareButtonTap: ControlEvent<Void>
        let nextButtonTap: ControlEvent<Void>
    }
    
    struct Output{
        let productsInputEmpty: Observable<RegisterSecondInformationDTO>
        let moveShare: Observable<RegisterSecondInformationDTO>
        let moveExchange: Observable<RegisterSecondInformationDTO>
    }
    
    func transform(_ input: Input) -> Output {
        
        let requestObservable = Observable.combineLatest(input.firstPriorityCategory,
                                                         input.firstProductName,
                                                         input.secondPriorityCategory,
                                                         input.secondProductName,
                                                         input.thirdPriorityCategory,
                                                         input.thirdProductName,
                                                         input.wantProductType)
        
        let moveShare = input.shareButtonTap
            .withLatestFrom(requestObservable)
            .map{
                self.setRegisterSecondInfoDTO($0, isFree: true)
            }
        
        let checkValidation = input.nextButtonTap
            .withLatestFrom(requestObservable)
            .map{
                self.checkExchangeValidation($0)
            }.share()
        
        let productInputEmpty = checkValidation
            .filter{ !$0 }
            .withLatestFrom(requestObservable)
            .map{
                self.setRegisterSecondInfoDTO($0, isFree: true)
            }
        
        let moveExchange = checkValidation
            .filter{ $0 }
            .withLatestFrom(requestObservable)
            .map{
                self.setRegisterSecondInfoDTO($0, isFree: false)
            }
        
        return Output(productsInputEmpty: productInputEmpty,
                      moveShare: moveShare,
                      moveExchange: moveExchange)
    }
    
    private func checkExchangeValidation(_ observable: RequestObservableType) -> Bool{
        [observable.firstCategory, observable.secondCategory, observable.thirdCategory].contains{ $0 != nil }
    }
    
    private func setRegisterSecondInfoDTO(_ observable: RequestObservableType, isFree: Bool) -> RegisterSecondInformationDTO{
        return RegisterSecondInformationDTO(
            firstPriorityCategory: observable.firstCategory,
            firstPriorityName: observable.firstProductName,
            secondPriorityCategory: observable.secondCategory,
            secondPriorityName: observable.secondProductName,
            thirdPriorityCategory: observable.thirdCategory,
            thirdPriorityName: observable.thirdProductName,
            anyZatch: observable.wantType.rawValue,
            isFree: isFree
        )
    }
    
}
