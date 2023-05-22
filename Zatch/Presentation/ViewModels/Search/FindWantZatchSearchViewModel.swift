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

class FindWantZatchSearchViewModel: FindWantZatchViewModelInterface{

    var popularKeywords = [PopularKeywords]()
    var lookingForZatches = ["몰랑이", "몰랑", "몰랑몰랑"]//[String]()
    
    let productName = PublishRelay<String>()
    let reloadPopularData = PublishSubject<Void>()
    let reloadLookingForData = PublishSubject<Void>()
    
    private let popularKeywordUseCase: PopularKeywordUseCaseInterface
    private let lookingForZatchUseCase: LookingForZatchUseCaseInterface

    init(popularKeywordUseCase: PopularKeywordUseCaseInterface = PopularKeywordUseCase(),
         lookingForZatchUseCase: LookingForZatchUseCaseInterface = LookingForZatchUseCase()){
        self.popularKeywordUseCase = popularKeywordUseCase
        self.lookingForZatchUseCase = lookingForZatchUseCase
    }
    
    private let disposeBag = DisposeBag()
    private let searchManager = ZatchSearchRequestManager.shared
    
    struct Input{
        let productNameTextField: Observable<String>
    }
    
    struct Output{
        let searchProduct: Driver<String>
    }
    
    func transform(_ input: Input) -> Output {
        
        input.productNameTextField
            .subscribe{
                self.productName.accept($0)
            }.disposed(by: disposeBag)
        
        productName
            .subscribe(onNext: {
                self.searchManager.wantProduct = $0
            }).disposed(by: disposeBag)
        
        let productName = productName
            .asDriver(onErrorJustReturn: "")
        
        return Output(searchProduct: productName)
    }
    
}

extension FindWantZatchSearchViewModel{
    
    func viewDidLoad(){
        //인기있는 재치 키워드 조회
        popularKeywordUseCase.execute()
            .subscribe{ [weak self] in
                if let data = $0 {
                    self?.popularKeywords = data
                    self?.reloadPopularData.onNext(Void())
                }
            }.disposed(by: disposeBag)
        
        //내가 찾는 재치 키워드 조회
        reloadLookingForData.onNext(Void())
    }
}
