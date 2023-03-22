//
//  ZatchSearchResultViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation
import RxSwift
import RxCocoa

class ZatchSearchResultViewModel: BaseViewModel{
    
    private var searchResult = [String]()
    private var selectedMyRegisterZatchIndex: Int?
    private var selectedLookingForZatchIndex: Int?
    private let myProductName = BehaviorSubject<String>(value: "") //TODO: 초기값 앞에서 설정한 것으로 붙이기
    private let wantProductName = BehaviorSubject<String>(value: "")
    private let myProductCategory = BehaviorSubject<Int?>(value: nil)
    private let wantProductCategory = BehaviorSubject<Int?>(value: nil)
    
    private let getRegisterZatchUseCase: GetRegisterZatchUseCaseInterface
    private let getLookingForZatchUseCase: LookingForZatchUseCaseInterface
    private let searchResultUseCase: SearchResultUseCaseInterface
    
    init(searchResultUseCase: SearchResultUseCaseInterface = SearchResultUseCase(),
         getRegisterZatchUseCase: GetRegisterZatchUseCaseInterface = GetRegisterZatchUseCase(),
         getLookingForZatchUseCase: LookingForZatchUseCaseInterface = LookingForZatchUseCase()){
        self.searchResultUseCase = searchResultUseCase
        self.getRegisterZatchUseCase = getRegisterZatchUseCase
        self.getLookingForZatchUseCase = getLookingForZatchUseCase
    }
    
    
    struct Input{
        
    }
    
    struct Output{
        let willEmptyViewHidden: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        
        let willEmptyViewHidden = Observable<String>.of("1") //TODO: searchResult 연관으로 바꾸기
            .map{ !$0.isEmpty }
            .asDriver(onErrorJustReturn: false)
        
        return Output(willEmptyViewHidden: willEmptyViewHidden)
    }
}

extension ZatchSearchResultViewModel{
    
    func getSearchResultCount() -> Int{
        searchResult.count
    }
    
    func getZatch(at index: Int) -> String{
        searchResult[index]
    }
    
    func changeMyProductName(_ value: String){
        myProductName.onNext(value)
    }

    func changeWantProductName(_ value: String){
        wantProductName.onNext(value)
    }
    
    func setMyProductCategory(id: Int){
        myProductCategory.onNext(id)
    }

    func setWantProductCategory(id: Int){
        wantProductCategory.onNext(id)
    }
}
