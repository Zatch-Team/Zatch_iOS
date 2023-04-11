//
//  FirstRegisterTestViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/11.
//

import Foundation
import RxSwift
import RxCocoa

struct RegisterFirstInformationDTO{
    let category: Int
    let productName: String
    let image: UIImage
    let count: String
    let buyDate: String
    let endDate: String
    let isOpen: Bool
}

final class FirstRegisterTestViewModel: BaseViewModel{
    
    var textFieldObservable: Observable<String>!
    
    struct Input{
        let categoryId: Observable<Int>
    }
    
    struct Output{
        
    }
    
    func transform(_ input: Input) -> Output {
        Observable.combineLatest(textFieldObservable, input.categoryId)
            .subscribe(onNext: {
                print($0, $1)
            })
        return Output()
    }
}

extension FirstRegisterTestViewModel{
}
