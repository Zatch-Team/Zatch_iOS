//
//  ZatchRegisterFirstViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/05.
//

import Foundation
import RxSwift
import RxCocoa

class ZatchRegisterFirstViewModel: BaseViewModel{
    
    struct Input{
//        let category: Observable<String>
        let productName: Observable<String>
//        let buyDate: Observable<String>
//        let endDate: Observable<String>
//        let isOpen: Observable<Bool>
    }
    
    struct Output{
        let productName: Driver<String>
    }
    
    func transform(_ input: Input) -> Output{
        
        let productName = input.productName
            .map{ $0 }
            .asDriver(onErrorJustReturn: "")
        
        return Output(productName: productName)
    }
}
