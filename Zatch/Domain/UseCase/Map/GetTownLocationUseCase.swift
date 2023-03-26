//
//  GetTownLocationUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation
import RxSwift

protocol GetTownLocationInterface {
    func execute(requestValue: LocationCoordinateRequestValue) -> Observable<GetTownResponseModel>
}

final class GetTownLocationUseCase: GetTownLocationInterface {

    private let mapRepository: MapRepositoryInterface

    init(mapRepository: MapRepositoryInterface = MapRepository()) {
        self.mapRepository = mapRepository
    }

    func execute(requestValue: LocationCoordinateRequestValue) -> Observable<GetTownResponseModel> {
        return mapRepository.getTownLocation(coordinate: requestValue)
    }
}
