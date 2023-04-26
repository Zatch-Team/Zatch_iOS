//
//  ModifyProfileViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation
import RxSwift
import RxCocoa

class ModifyProfileViewModel: BaseViewModel{
    
    struct Input{
        let profileImage: Observable<UIImage>
        let nickname: Observable<String>
        let registerButtonTap: ControlEvent<Void>
    }
    
    struct Output{
//        let nickname: Driver<String> //8자 제한으로 반환
    }
    
    func transform(_ input: Input) -> Output{
        return Output()
    }
}
