//
//  MyZatchDetailViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/14.
//

import Foundation
import RxSwift

class MyZatchDetailViewModel: BaseViewModel {
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let deleteBtnTap: Observable<Void>
    }
    
    struct Output{
        let deleteResponse: Observable<ResponseState>
    }
    
    func transform(_ input: Input) -> Output {
        //TODO: API 요청
        let deleteResponse = input.deleteBtnTap
            .map{
                return ResponseState.success
            }.share()
        
        return Output(deleteResponse: deleteResponse)
    }
    
    
}
