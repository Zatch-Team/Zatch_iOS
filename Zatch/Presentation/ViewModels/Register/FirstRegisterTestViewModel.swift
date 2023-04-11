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
    
    var productName: Observable<String>!
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let categoryId: Observable<Int>
        let buyDate: Observable<Register.DateString?>
        let endDate: Observable<Register.DateString?>
        let isOpen: Observable<Int>
    }
    
    struct Output{
        
    }
    
    func transform(_ input: Input) -> Output {
        
        
        
        let requestObservable = Observable.combineLatest(input.categoryId,
                                                         productName,
                                                         input.buyDate,
                                                         input.endDate,
                                                         input.isOpen)
            .map{
                return $0
            }.asObservable()
        
        return Output()
    }
}

extension FirstRegisterTestViewModel{
}
