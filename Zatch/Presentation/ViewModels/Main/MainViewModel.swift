//
//  MainViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainViewModelInterface{
    var aroundZatch: [(Int, Bool)] { get }
    var popularZatch: [(Int, Bool)] { get }
}

protocol ZatchLikeViewModelInterface{
    func changeAroundZatchState(_ state: Bool, index: Int)
    func changePopularZatchState(_ state: Bool, index: Int)
}

class MainViewModel: MainViewModelInterface, ZatchLikeViewModelInterface, BaseViewModel{
    
    var aroundZatch = [(Int, Bool)](repeating: (0, false), count: 10)
    var popularZatch = [(Int, Bool)](repeating: (0, false), count: 10)
    
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
        
        let input = ZatchLikeViewModel.Input(zatchId: aroundZatch[index].0, heartState: state)
        
        let output = likeViewModel.transform(input)
        output.heartState
            .subscribe(onNext: {
                if let data = $0 {
                    self.aroundZatch[index].1 = data.isHeart
                }
            }).disposed(by: disposeBag)
    }
        
    func changePopularZatchState(_ state: Bool, index: Int) {
        
        let input = ZatchLikeViewModel.Input(zatchId: popularZatch[index].0, heartState: state)
        
        let output = likeViewModel.transform(input)
        output.heartState
            .subscribe(onNext: {
                if let data = $0 {
                    self.popularZatch[index].1 = data.isHeart
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
