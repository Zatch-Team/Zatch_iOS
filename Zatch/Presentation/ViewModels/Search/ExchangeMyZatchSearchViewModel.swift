//
//  ExchangeMyZatchSearchViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/12.
//

import Foundation
import RxSwift
import RxCocoa

class ExchangeMyZatchSearchViewModel: BaseViewModel{
    
    struct Input{
        let exchangeProductName: Observable<String>
    }
    
    struct Output{
        let canMoveNext: Driver<Bool>
        let exchangeProductName: Driver<String>
    }
    
    func transform(_ input: Input) -> Output {
        
        let canMoveNext = input.exchangeProductName
            .map{
                !$0.isEmpty
            }.asDriver(onErrorJustReturn: false)
        
        let productName = input.exchangeProductName
            .asDriver(onErrorJustReturn: "")
        
        return Output(canMoveNext: canMoveNext,
                      exchangeProductName: productName)
    }
    
}
