//
//  MainViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxSwift
import RxCocoa

struct TemporaryData{
    static let zatch = ZatchResponseModel(
        anyZatch: 1,
        categoryId: 1,
        content: "임시 콘텐츠",
        expirationDate: "2022.02.02",
        id: 10,
        isFree: true,
        isOpened: 1,
        itemName: "몰랑이 몰랑이",
        likeCount: 10,
        purchaseDate: "2022.02.03",
        quantity: 1,
        userId: 1,
        isLike: false
    )
}

protocol MainViewModelInterface{
    var aroundZatch: [ZatchResponseModel] { get }
    var popularZatch: [ZatchResponseModel] { get }
}

protocol ZatchLikeViewModelInterface{
    func changeAroundZatchState(_ state: Bool, index: Int)
    func changePopularZatchState(_ state: Bool, index: Int)
}

class MainViewModel: MainViewModelInterface, ZatchLikeViewModelInterface, BaseViewModel{
    
    var aroundZatch = [ZatchResponseModel](repeating: TemporaryData.zatch, count: 10)
    var popularZatch = [ZatchResponseModel](repeating: TemporaryData.zatch, count: 10)
    
    private var currentTownIndex = BehaviorSubject(value: 0)
    private var myTowns: [String] = ["상현동", "성복동", "풍덕천동"]
    
    struct Input{
        
    }
    
    struct Output{
        let currentTown: Driver<String>
    }
    
    private let aroundZatchUseCase: AroundZatchUseCaseInterface
    private let popularZatchUseCase: PopularZatchUseCaseInterface
    private let myTownUseCase: GetMyTownUseCaseInterface
    
    private let likeViewModel: ZatchLikeViewModel
    
    init(aroundZatchUseCase: AroundZatchUseCaseInterface = AroundZatchUseCase(),
         popularZatchUseCase: PopularZatchUseCaseInterface = PopularZatchUseCase(),
         myTownUseCase: GetMyTownUseCaseInterface = GetMyTownUseCase()){
        self.aroundZatchUseCase = aroundZatchUseCase
        self.popularZatchUseCase = popularZatchUseCase
        self.myTownUseCase = myTownUseCase
        self.likeViewModel = ZatchLikeViewModel()
    }
    
    private let disposeBag = DisposeBag()
    
    func transform(_ input: Input) -> Output {
        let currentTown = currentTownIndex
            .map{
                self.myTowns[$0]
            }.asDriver(onErrorJustReturn: "")
        
        return Output(currentTown: currentTown)
    }
    
    func changeAroundZatchState(_ state: Bool, index: Int) {
        
        let input = ZatchLikeViewModel.Input(zatchId: aroundZatch[index].id, heartState: state)
        let output = likeViewModel.transform(input)
        
        output.heartState
            .subscribe(onNext: { [weak self] in
                if let data = $0 {
                    self?.aroundZatch[index].isLike = data.isHeart
                    self?.aroundZatch[index].likeCount = data.likeCount
                }
            }).disposed(by: disposeBag)
    }
        
    func changePopularZatchState(_ state: Bool, index: Int) {
    
        let input = ZatchLikeViewModel.Input(zatchId: popularZatch[index].id, heartState: state)
        let output = likeViewModel.transform(input)
        
        output.heartState
            .subscribe(onNext: { [weak self] in
                if let data = $0 {
                    self?.popularZatch[index].isLike = data.isHeart
                    self?.popularZatch[index].likeCount = data.likeCount
                }
            }).disposed(by: disposeBag)
    }
}

//MARK: - Method
extension MainViewModel{
    
    func getTownName(by index: Int) -> String{
        myTowns[index]
    }
    
    func getCurrentTownIndex() -> Int{
        (try? currentTownIndex.value()) ?? -1
    }
    
    func changeCurrentTown(index: Int){
        currentTownIndex.onNext(index)
    }
    
    func myTownCount() -> Int{
        myTowns.count
    }
}
