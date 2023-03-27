//
//  MapRepository.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation
import RxSwift

class MapRepository: MapRepositoryInterface{
    
    func placeSearch(query: PlaceSearchRequestValue) {
        
    }
    
    func getTownLocation(coordinate: LocationCoordinateRequestValue) -> Observable<GetTownResponseModel> {
        let observable = Observable<GetTownResponseModel>.create { observer -> Disposable in
            let requestReference: () = MapService.shared.getTownLoacation(coordinate: coordinate){ response in
                switch response {
                case .success(let data):
                    observer.onNext(data)
                case .failure(let err):
                    print(err)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
    
    func getMeetingLocation(coordinate: LocationCoordinateRequestValue)
//    -> Observable<MeetingLoactionResponseModel>
    {
//        let observable = Observable<MeetingLoactionResponseModel>.create { observer -> Disposable in
//            let requestReference: () = MapService.shared.getMeetingLocation(coordinate: coordinate){ response in
//                switch response {
//                case .success(let data):
////                    if let data = data {
//                        observer.onNext(data)
////                    }
//                case .failure(let err):
//                    print(err)
//                }
//            }
//            return Disposables.create(with: { requestReference })
//        }
//        return observable
        
    }
}
