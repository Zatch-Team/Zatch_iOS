//
//  MainViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/01/24.
//

import Foundation
import RxSwift

class MainViewModel: BaseViewModel{
    
    struct Input{
        let bottomSheetWillAppear: Observable<Void>
        let bottomSheetWillDisappear: Observable<Void>
    }
    
    struct Output{
        
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
