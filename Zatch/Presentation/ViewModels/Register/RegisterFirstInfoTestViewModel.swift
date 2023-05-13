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
    let images: [UIImage]
    let count: String?
    let buyDate: String?
    let endDate: String?
    let isOpen: Int
}

final class RegisterFirstInfoTestViewModel: BaseViewModel{
    
    var productName: Observable<String>!
    var images: Observable<[UIImage]>!
    
    private let disposeBag = DisposeBag()
    
    struct Input{
        let nextButtonTap: ControlEvent<Void>
        let categoryId: Observable<Int?>
        let count: Observable<String>
        let countUnit: Observable<String?>
        let buyDate: Observable<Register.DateString?>
        let endDate: Observable<Register.DateString?>
        let isOpen: Observable<Int>
    }
    
    struct Output{
        let zatchDTO: Driver<RegisterFirstInformationDTO?>
        let dissatisfactionType: Driver<Alert>
    }
    
    func transform(_ input: Input) -> Output {
        
        //count, countUnit 데이터 합치기
        let countObservable = Observable.combineLatest(input.count, input.countUnit)
            .map{
                $0.isEmpty || $1 == nil ? nil : $0 + $1!
            }.share()
        
        let buyDateObservable = input.buyDate
            .map{
                self.dateFormat($0)
            }.share()
        
        let endDateObservable = input.endDate
            .map{
                self.dateFormat($0)
            }.share()
        
        let requestObservable = Observable
            .combineLatest(
                input.categoryId,
                productName,
                images,
                countObservable,
                buyDateObservable,
                endDateObservable,
                input.isOpen
            ).share()
        
        let isDissatisfaction: Observable<Alert?> = input.nextButtonTap
            .withLatestFrom(requestObservable)
            .map{ category, productName, images, count, buyDate, endDate, isOpen in
                if category == nil {
                    return Alert.RegisterCategory
                }else if productName.isEmpty {
                    return Alert.ProductName
                }
                else if images.count == 0 {
                    return Alert.ImageMin
                }
                else if category == 0 && buyDate == nil {
                    return Alert.BuyDate
                }else if category == 0 && endDate == nil {
                    return Alert.EndDate
                }else{
                    return nil
                }
            }.share()
        
        let dissatisfactionType = isDissatisfaction
            .compactMap{ $0 }
            .asDriver(onErrorJustReturn: .RegisterCategory)
        
        let zatchDTO = isDissatisfaction
            .filter{ $0 == nil }
            .withLatestFrom(requestObservable)
            .map{ category, productName, images, count, buyDate, endDate, isOpen in
                return RegisterFirstInformationDTO(
                    category: category!,
                    productName: productName,
                    images: images,
                    count: count,
                    buyDate: buyDate,
                    endDate: endDate,
                    isOpen: isOpen
                )
            }.asDriver(onErrorJustReturn: nil)
        
        
        return Output(zatchDTO: zatchDTO,
                      dissatisfactionType: dissatisfactionType)
    }
    
    private func dateFormat(_ date: Register.DateString?) -> String?{
        guard let date = date else { return nil }
        return date.year + "." + date.month.dateFormat + "." + date.date.dateFormat
    }
}
