//
//  MainViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel: BaseViewModel{
    
    private var currentTownIndex = BehaviorSubject(value: 0)
    private var myTowns: [String] = ["상현동", "성복동", "풍덕천동"]
    private var aroundZatch = [Int](repeating: 0, count: 10)
    private var popularZatch = [Int](repeating: 0, count: 3)
    
    struct Input{
    }
    
    struct Output{
        let currentTown: Driver<String>
    }
    
    private let aroundZatchUseCase: AroundZatchUseCaseInterface
    private let popularZatchUseCase: PopularZatchUseCaseInterface
//    private let heartZatchUseCase: HeartZatchUseCaseInterface
    private let myTownUseCase: GetMyTownUseCaseInterface
    
    init(aroundZatchUseCase: AroundZatchUseCaseInterface = AroundZatchUseCase(),
         popularZatchUseCase: PopularZatchUseCaseInterface = PopularZatchUseCase(),
//         heartZatchUseCase: HeartZatchUseCaseInterface = HeartZatchUseCase(),
         myTownUseCase: GetMyTownUseCaseInterface = GetMyTownUseCase()){
        self.aroundZatchUseCase = aroundZatchUseCase
        self.popularZatchUseCase = popularZatchUseCase
//        self.heartZatchUseCase = heartZatchUseCase
        self.myTownUseCase = myTownUseCase
    }
    
    func transform(_ input: Input) -> Output {
        let currentTown = currentTownIndex
            .map{
                self.myTowns[$0]
            }.asDriver(onErrorJustReturn: "")
        
        return Output(currentTown: currentTown)
    }
    
//    func viewWillAppear(){
//
//    }
//
//    func viewWillDisappear(){
//
//    }
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
    
    func aroundZatchCount() -> Int{
        aroundZatch.count
    }
    
    func popularZatchCount() -> Int{
        popularZatch.count
    }
}
