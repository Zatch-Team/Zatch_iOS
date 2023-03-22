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
    
    private let searchInitialValue = "?"
    
    private var searchResult = [String]()
    private var selectedMyRegisterZatchIndex: Int?
    private var selectedLookingForZatchIndex: Int?
    
    private let myProductName = BehaviorSubject<String>(value: "몰랑이") //TODO: 초기값 앞에서 설정한 것으로 붙이기
    private let wantProductName = BehaviorSubject<String>(value: "손수건")
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
    
    
    struct Input{ }
    
    struct Output{
        let isMyProductCategorySelect: Driver<Bool>
        let isWantProductCategorySelect: Driver<Bool>
        let myProductCategory: Driver<Int?>
        let wantProductCategory: Driver<Int?>
        let myProductName: Driver<String>
        let wantProductName: Driver<String>
        let willEmptyViewHidden: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        
        let myProductCategoryConverter = myProductCategory
            .scan((nil, nil)){ $0.1 == $1 ? (nil, nil) : ($0.1, $1) }
            .map{ $0.1 }
        
        let myProductCategory = myProductCategoryConverter
            .asDriver(onErrorJustReturn: nil)
        
        let isMyProductCategorySelect = myProductCategoryConverter
            .map{ $0 == nil ? false : true }
            .asDriver(onErrorJustReturn: false)
        
        let wantProductCategoryConverter = wantProductCategory
            .scan((nil, nil)){ $0.1 == $1 ? (nil, nil) : ($0.1, $1) }
            .map{ $0.1 }
        
        let wantProductCategory = wantProductCategoryConverter
            .asDriver(onErrorJustReturn: nil)
        
        let isWantProductCategorySelect = wantProductCategoryConverter
            .map{ $0 == nil ? false : true }
            .asDriver(onErrorJustReturn: false)
        
        let myProductName = myProductName
            .asDriver(onErrorJustReturn: searchInitialValue)
        
        let wantProductName = wantProductName
            .asDriver(onErrorJustReturn: searchInitialValue)
            
        let willEmptyViewHidden = Observable<String>.of("1") //TODO: searchResult 연관으로 바꾸기
            .map{ !$0.isEmpty }
            .asDriver(onErrorJustReturn: false)
        
        return Output(isMyProductCategorySelect: isMyProductCategorySelect,
                      isWantProductCategorySelect: isWantProductCategorySelect,
                      myProductCategory: myProductCategory,
                      wantProductCategory: wantProductCategory,
                      myProductName: myProductName,
                      wantProductName: wantProductName,
                      willEmptyViewHidden: willEmptyViewHidden)
    }
    
    func pressTextFieldReturnKey(myProduct: String?, wantProduct: String?){
        selectedMyRegisterZatchIndex = nil
        selectedLookingForZatchIndex = nil
        myProductName.onNext(myProduct ?? searchInitialValue)
        wantProductName.onNext(wantProduct ?? searchInitialValue)
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