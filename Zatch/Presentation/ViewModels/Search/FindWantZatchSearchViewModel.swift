//
//  FindWantZatchSearchViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol GetPopularSearchKeywordInterface{
    var reloadPopularData: PublishSubject<Void> { get }
    var popularKeywords: [PopularKeywords] { get }
}

protocol GetWantZatchKeywordInterface{
    var reloadLookingForData: PublishSubject<Void> { get }
    var lookingForZatches : [String] { get }
}

protocol SearchProductInterface{
    var productName: PublishRelay<String> { get }
}

protocol FindWantZatchViewModelInterface: BaseViewModel, GetPopularSearchKeywordInterface, GetWantZatchKeywordInterface, SearchProductInterface {
    func viewDidLoad()
}

class FindWantZatchSearchViewModel: BaseViewModel{
    
    private var searchPopularKeywords = ["몰랑이","몰랑몰랑","몰랑"] //최대 3개
    private var lookingForZatches = ["몰랑이","몰랑몰랑","몰랑"] //최대 3개
    
    private let searchManager = ZatchSearchRequestManager.shared
    
    private let wantProductName = PublishSubject<String>()
    private let disposeBag = DisposeBag()
    
    private let popularKeywordUseCase: PopularKeywordUseCaseInterface
    private let lookingForZatchUseCase: LookingForZatchUseCaseInterface

    init(popularKeywordUseCase: PopularKeywordUseCaseInterface = PopularKeywordUseCase(),
         lookingForZatchUseCase: LookingForZatchUseCaseInterface = LookingForZatchUseCase()){
        self.popularKeywordUseCase = popularKeywordUseCase
        self.lookingForZatchUseCase = lookingForZatchUseCase
    }
    
    struct Input{
        let productNameTextField: Observable<String>
    }
    
    struct Output{
        let searchProduct: Driver<String>
    }
    
    func transform(_ input: Input) -> Output {
        
        input.productNameTextField
            .subscribe{
                self.wantProductName.onNext($0)
            }.disposed(by: disposeBag)
        
        wantProductName
            .subscribe(onNext: {
                self.searchManager.wantProduct = $0
            }).disposed(by: disposeBag)
        
        let productName = wantProductName
            .asDriver(onErrorJustReturn: "")
        
        return Output(searchProduct: productName)
    }
    
}

extension FindWantZatchSearchViewModel{
    
    func getPopularKeywordsCount() -> Int{
        searchPopularKeywords.count
    }
    
    func getLookingForZatchCount() -> Int{
        lookingForZatches.count
    }
    
    func getPopularKeyword(at: Int) -> String{
        searchPopularKeywords[at]
    }
    
    func getLookingForZatch(at: Int) -> String{
        lookingForZatches[at]
    }
    
    func selectPopularKeyword(at index: Int){
        wantProductName.onNext(searchPopularKeywords[index])
    }
    
    func selectLookingForZatch(at index: Int){
        wantProductName.onNext(lookingForZatches[index])
    }
    
    func deselectCell(){
        wantProductName.onNext("")
    }
}
