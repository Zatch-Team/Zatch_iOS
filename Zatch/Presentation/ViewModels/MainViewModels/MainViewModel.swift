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
        let townArrowIsUp: Driver<Bool>
        let townArrowIsDown: Driver<Bool>
    }
    
    func transform(_ input: Input) -> Output {
        
        var townArrowIsUp = input.bottomSheetWillAppear
            .map{ true }
            .asDriver(onErrorJustReturn: false)
        
        var townArrowIsDown = input.bottomSheetWillDisappear
            .map{ false }
            .asDriver(onErrorJustReturn: false)
        
        return Output(townArrowIsUp: townArrowIsUp,
                      townArrowIsDown: townArrowIsDown
        )
    }
}
