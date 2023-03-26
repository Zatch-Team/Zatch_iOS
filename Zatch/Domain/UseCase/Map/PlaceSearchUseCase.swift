//
//  PlaceSearchUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation

struct PlaceSearchRequestValue {
    let place: String
}

protocol PlaceSearchUseCaseInterface {
    func execute(requestValue: PlaceSearchRequestValue) async throws
}

final class PlaceSearchUseCase: PlaceSearchUseCaseInterface {

    private let mapRepository: MapRepositoryInterface

    init(mapRepository: MapRepositoryInterface = MapRepository()) {
        self.mapRepository = mapRepository
    }

    func execute(requestValue: PlaceSearchRequestValue) async throws {
        return try await mapRepository.placeSearch(query: requestValue)
    }
}
