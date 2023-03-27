//
//  TownRegisterMapViewModel.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation
import RxSwift
import RxCocoa
import CoreLocation

class TownRegisterMapViewModel: BaseViewModel{
    
    private typealias Coordinate = (x: Double, y: Double)
    private let disposeBag = DisposeBag()
    private let townLocationSubject = PublishSubject<Coordinate>()
    private let currentLocationSubject = PublishSubject<Coordinate>()
    private var townLocation: Coordinate!
    
    
    private let getTownLocationUseCase: GetTownLocationUseCaseInterface
    
    init(getTownLocationUseCase: GetTownLocationUseCaseInterface = GetTownLocationUseCase()){
        self.getTownLocationUseCase = getTownLocationUseCase
    }
    
    struct Input{
        let locationManager: CLLocationManager
        let registerButtonControlEvent: ControlEvent<Void>
    }
    
    struct Output{
        let selectTown: Driver<String>
        let isValidLocation: Observable<Bool>
    }
    
    func transform(_ input: Input) -> Output{
        
        input.registerButtonControlEvent
            .subscribe(onNext: { [weak self] in
                if let townLocation = self?.townLocation, let location = input.locationManager.location?.coordinate{
                    self?.townLocationSubject.onNext(townLocation)
                    self?.currentLocationSubject.onNext((x: location.longitude, y:location.latitude))
                }
            }).disposed(by: disposeBag)
        
        let currentLocationResponeValue = currentLocationSubject
            .map{
                LocationCoordinateRequestValue(x: String(abs($0.x)), y: String(abs($0.y)))
            }.flatMap{
                self.getTownLocationUseCase.execute(requestValue: $0)
            }.map{
                $0.documents[1].region_3depth_name
            }.share()
        
        let selectTownResponseValue = townLocationSubject
            .map{
                LocationCoordinateRequestValue(x: String($0.x), y: String($0.y))
            }.flatMap{
                self.getTownLocationUseCase.execute(requestValue: $0)
            }.map{
                $0.documents[1].region_3depth_name
            }.share()
        
        var isValid = Observable.zip(currentLocationResponeValue, selectTownResponseValue)
            .map{
                $0.0 == $0.1
            }
        
        let town = Observable.zip(isValid, selectTownResponseValue)
            .filter{
                $0.0
            }.map{
                $0.1
            }.asDriver(onErrorJustReturn: "")
        
        isValid = isValid
            .filter{
                !$0
            }.asObservable()

        return Output(selectTown: town,
                      isValidLocation: isValid)
    }

}

extension TownRegisterMapViewModel: MapLocationSelectable{
    func changeLocationMarker(x: Double, y: Double) {
        townLocation = (x: x, y: y)
    }
}
