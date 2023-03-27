//
//  MapRepositoryInterface.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation
import RxSwift

protocol MapRepositoryInterface{
    func placeSearch(query: PlaceSearchRequestValue)
    func getTownLocation(coordinate: LocationCoordinateRequestValue) -> Observable<GetTownResponseModel>
    func getMeetingLocation(coordinate: LocationCoordinateRequestValue)
//    -> Observable<MeetingLoactionResponseModel>
}
