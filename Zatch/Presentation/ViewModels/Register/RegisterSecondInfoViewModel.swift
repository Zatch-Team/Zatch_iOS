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
    let firstPriority: RegisterZatchRequestModel.WantProductPriority?
    let secondPriority: RegisterZatchRequestModel.WantProductPriority?
    let thirdPriority: RegisterZatchRequestModel.WantProductPriority?
    let wantProductType: Int
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
        
        let category = [observable.firstCategory, observable.secondCategory, observable.thirdCategory]
        let productName = [observable.firstProductName, observable.secondProductName, observable.thirdProductName]
        let zip = zip(category, productName)
        
        return zip.contains{ $0.0 != nil && !$0.1.isEmpty }
    }
    
    private func setRegisterSecondInfoDTO(_ observable: RequestObservableType, isFree: Bool) -> RegisterSecondInformationDTO{
        return RegisterSecondInformationDTO(
            firstPriority: getPriorityModel(
                priority: 1,
                cateogoryId: observable.firstCategory,
                productName: observable.firstProductName
            ),
            secondPriority: getPriorityModel(
                priority: 2,
                cateogoryId: observable.secondCategory,
                productName: observable.secondProductName
            ),
            thirdPriority: getPriorityModel(
                priority: 3,
                cateogoryId: observable.thirdCategory,
                productName: observable.thirdProductName
            ),
            wantProductType: observable.wantType.rawValue,
            isFree: isFree
        )
    }
    
    private func getPriorityModel(priority: Int, cateogoryId: Int?, productName: String) -> RegisterZatchRequestModel.WantProductPriority?{
        if cateogoryId == nil || productName.isEmpty {
            return nil
        }
        return RegisterZatchRequestModel.WantProductPriority(priority: priority, p_name: productName, p_category: cateogoryId!)
    }
    
}
