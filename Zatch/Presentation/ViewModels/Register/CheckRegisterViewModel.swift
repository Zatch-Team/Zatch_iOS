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
            anyZatch: wantProduct.wantProductType,
            categoryId: myProduct.category,
            content: comment,
            expirationDate: myProduct.endDate,
            isFree: wantProduct.isFree,
            isOpened: myProduct.isOpen,
            itemName: myProduct.productName,
            purchaseDate: myProduct.buyDate,
            quantity: myProduct.count,
            priorites: getPriorites(wantProduct),
            userId: 0
        )
    }
    
    private func getPriorites(_ wantProduct: RegisterSecondInformationDTO) -> [RegisterZatchRequestModel.WantProductPriority]{
        wantProduct.isFree ? [] : [wantProduct.firstPriority, wantProduct.secondPriority, wantProduct.thirdPriority].compactMap{ $0 }
    }
}
