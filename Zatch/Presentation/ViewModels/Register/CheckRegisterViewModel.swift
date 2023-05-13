//
//  CheckRegisterViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/17.
//

import Foundation
import RxSwift
import RxCocoa

class CheckRegisterViewModel: BaseViewModel{
    
    private let registerUseCase: RegisterUseCaseInterface
    
    init(registerUseCase: RegisterUseCaseInterface = RegisterUseCase()){
        self.registerUseCase = registerUseCase
    }
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let myProductInfo: RegisterFirstInformationDTO
        let wantProductInfo: RegisterSecondInformationDTO
        let comment: Observable<String>
        let registerButtonTap: Observable<Void>
    }
    
    struct Output{
//        let registerRequestStatus: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output {
        let commentObservable = input.comment
            .map{
                $0 == CheckRegisterView.placeholder ? "" : $0
            }
        
//        let registerRequestStatus =
        input.registerButtonTap
            .withLatestFrom(commentObservable)
//            .map{
//                return self.makeRequestModel(
//                    myProduct: input.myProductInfo,
//                    wantProduct: input.wantProductInfo,
//                    comment: $0
//                )
//            }.flatMap{
//                self.registerUseCase.execute(requestValue: $0)
//            }
        
        return Output()
    }
    
    private func makeRequestModel(myProduct: RegisterFirstInformationDTO, wantProduct: RegisterSecondInformationDTO, comment: String) -> RegisterZatchRequestModel{
        return RegisterZatchRequestModel(
            categoryId: myProduct.category,
            anyZatch: wantProduct.anyZatch,
            content: comment,
            expirationDate: myProduct.endDate,
            isFree: wantProduct.isFree,
            isOpened: myProduct.isOpen,
            itemName: myProduct.productName,
            purchaseDate: myProduct.buyDate,
            quantity: myProduct.count,
            p_first_category: wantProduct.firstPriorityCategory,
            p_first_name: wantProduct.firstPriorityName,
            p_second_category: wantProduct.secondPriorityCategory,
            p_second_name: wantProduct.secondPriorityName,
            p_third_category: wantProduct.thirdPriorityCategory,
            p_third_name: wantProduct.thirdPriorityName
        )
    }
}
