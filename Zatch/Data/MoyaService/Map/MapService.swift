//
//  MapService.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation

public class MapService {
    
    static let shared = MapService()
    let provider = BaseService(plugins: [MoyaLoggerPlugin()])
    
    private init() { }
    
    func getPlaceSearchResult(place: PlaceSearchRequestValue, completion: @escaping (Result<PlaceSearchRepsonseModel, Error>) -> Void){
        provider.requestDecoded(MapRouter.placeSearch(query: place)){ response in
            completion(response)
        }
    }
    
    func getTownLoacation(coordinate: LocationCoordinateRequestValue, completion: @escaping (Result<GetTownResponseModel, Error>) -> Void){
            provider.requestDecoded(MapRouter.getTownLocation(coordinate: coordinate)){ response in
            completion(response)
        }
    }
    
    func getMeetingLocation(completion: @escaping  (Result<MeetingLoactionResponseModel, Error>) -> Void){
        provider.requestDecoded(MapRouter.getMeetingLocation){ response in
            completion(response)
        }
    }
}
