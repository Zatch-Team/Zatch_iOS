//
//  ZatchTableViewCellViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/14.
//

import Foundation
import RxSwift
import RxCocoa

class ZatchTableViewCellViewModel: BaseViewModel{
    
    struct Input{
        let heartState: Observable<Bool>
    }
    
    struct Output{
    }
    
    func transform(_ input: Input) -> Output {
        
        //heart 상태 변경시 API 호출
        
        return Output()
    }
    
    
}
