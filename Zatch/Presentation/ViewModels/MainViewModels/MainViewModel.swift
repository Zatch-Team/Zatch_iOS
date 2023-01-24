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
    
    struct Input{
        let bottomSheetWillAppear: Observable<Void>
        let bottomSheetWillDisappear: Observable<Void>
    }
    
    struct Output{
        let townArrowWillUp: Driver<Bool>
        let townArrowWillDown: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        
        let townArrowWillUp = input.bottomSheetWillAppear
            .map{ true }
            .asDriver(onErrorJustReturn: false)
        
        let townArrowWillDown = input.bottomSheetWillDisappear
            .map{ true }
            .asDriver(onErrorJustReturn: false)
        
        return Output(townArrowWillUp: townArrowWillUp,
                      townArrowWillDown: townArrowWillDown
        )
    }
}
