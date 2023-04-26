//
//  ProfileViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation
import RxSwift
import RxCocoa

class ProfileViewModel: BaseViewModel{
    
    struct Input{
        let userId: Int
    }
    
    struct Output{
//        let nickname: Driver<String>
//        let profileImage: Driver<String>
//        let starRating: Driver<Int>
//        let oneLineComment: Driver<String>
//        let willZatchTableReload: Driver<Void>
    }
    
    func transform(_ input: Input) -> Output{
        return Output()
    }
}
