//
//  GetMeetingLocationUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation
import RxSwift

protocol GetMeetingLocationInterface {
    func execute(requestValue: LocationCoordinateRequestValue)
//    -> Observable<MeetingLoactionResponseModel>
}

final class GetMeetingLocationUseCase: GetMeetingLocationInterface {

    private let mapRepository: MapRepositoryInterface

    init(mapRepository: MapRepositoryInterface = MapRepository()) {
        self.mapRepository = mapRepository
    }

    func execute(requestValue: LocationCoordinateRequestValue)
//    -> Observable<MeetingLoactionResponseModel>
    {
//        return mapRepository.getMeetingLocation(coordinate: requestValue)
    }
}
