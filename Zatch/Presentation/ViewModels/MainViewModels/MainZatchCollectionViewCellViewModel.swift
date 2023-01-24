//
//  MainZatchCollectionViewCellViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxCocoa
import RxSwift

class MainZatchCollectionViewCellViewModel: BaseViewModel{
    
    struct Input{
        let heartTap: ControlEvent<Void>
        let heartState: Observable<Bool>
    }
    
    struct Output{
        let isHeartSelected: Driver<Bool>
    }
    
    
    func transform(input: Input) -> Output{
        
        let heartObservable = Observable.zip(input.heartTap,
                                             input.heartState)
    
        let isHeartSelected = heartObservable
            .map{ !$1 }
            .asDriver(onErrorJustReturn: false)
        
        return Output(isHeartSelected: isHeartSelected)
    }
}
