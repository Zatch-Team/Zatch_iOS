//
//  MapRouter.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/26.
//

import Foundation
import Moya

enum MapRouter: BaseRouter{
//    typealias ResultModel = Album
    case placeSearch(query: PlaceSearchRequestValue)
    case getTownLocation(coordinate: LocationCoordinateRequestValue)
    case getMeetingLocation
}

extension MapRouter{
    
    var baseURL: URL {
        return URL(string: "https://dapi.kakao.com")!
    }

    var headers: [String: String]? {
        let header = [
            "Content-Type": "application/json",
            "Authorization": "KakaoAK \(Const.KakaoAPI.KAKAO_REST_API_KEY)"]
        return header
    }
    
    var path: String {
        switch self {
        case .placeSearch:
            return HTTPMethodURL.GET.placeSearch
        case .getTownLocation:
            return HTTPMethodURL.GET.townLocation
        case .getMeetingLocation:
            return HTTPMethodURL.GET.meetingLocation
        }
    }
    
    var method: Moya.Method {
        switch self {
        default:    return .get
        }
    }
    
    var task: Task {
        switch self {
        case .placeSearch(let request):
            return .requestParameters(parameters: ["query" : request.place],
                                      encoding: URLEncoding.queryString)
        case .getTownLocation(let request):
            return .requestParameters(parameters: ["x": request.x,
                                                   "y": request.y],
                                      encoding: URLEncoding.queryString)
        default: return .requestPlain
        }
    }
}


