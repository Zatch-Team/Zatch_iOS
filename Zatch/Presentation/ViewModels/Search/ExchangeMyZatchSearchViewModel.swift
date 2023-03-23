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
    
    private var myZatches = ["몰랑이 피규어","매일우유 250ml","콜드브루 60ml","예시가 있다면",
                             "이렇게 들어가야","해요요요요","해요요요","해요요","해요","해","아아앙아ㅏ앙아아앙아아"]
    private let searchManager = ZatchSearchRequestManager.shared
    private let exchangeProduct = PublishSubject<String>()
    private let disposeBag = DisposeBag()

    private let myZatchUseCase: GetRegisterZatchUseCaseInterface
    
    init(myZatchUseCase: GetRegisterZatchUseCaseInterface = GetRegisterZatchUseCase()){
        self.myZatchUseCase = myZatchUseCase
    }
    
    struct Input{
        let exchangeProductByTextField: Observable<String>
    }
    
    struct Output{
        let canMoveNext: Driver<Bool>
        let exchangeProductName: Driver<String>
    }
    
    func transform(_ input: Input) -> Output {
        
        input.exchangeProductByTextField
            .map{ $0 }
            .subscribe{ self.exchangeProduct.onNext($0) }
            .disposed(by: disposeBag)
        
        let canMoveNext = input.exchangeProductByTextField
            .map{ !$0.isEmpty }
            .asDriver(onErrorJustReturn: false)
        
        exchangeProduct
            .subscribe{ self.searchManager.myProduct = $0 }
            .disposed(by: disposeBag)
        
        let productName = exchangeProduct
            .asDriver(onErrorJustReturn: "")
           
        return Output(canMoveNext: canMoveNext,
                      exchangeProductName: productName)
    }
}

extension ExchangeMyZatchSearchViewModel{
    
    func willSkipSelectMyZatch(){
        searchManager.myProduct = ""
    }

    func willSelectZatch(at index: Int){
        exchangeProduct.onNext(myZatches[index])
    }
    
    func willDeselectMyZatch(){
        exchangeProduct.onNext("")
    }
    
    func getMyZatchesCount() -> Int{
        myZatches.count
    }
    
    func getMyZatch(at index: Int) -> String{
        myZatches[index]
    }
}
