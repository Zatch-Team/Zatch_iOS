//
//  KakaoLocalDataManager.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/10.
//

import Foundation
import Alamofire

class KakaoLocalDataManager{
    
    let headers : HTTPHeaders = [.authorization("KakaoAK \(Const.KakaoAPI.KAKAO_REST_API_KEY)")]
    
    func getPlaceSearch(query: String, viewController: SearchAddressResultBottomSheet){

        AF.request("https://dapi.kakao.com/v2/local/search/keyword.json", method: .get, parameters: ["query":query], encoding: URLEncoding.queryString, headers: self.headers).validate().responseDecodable(of: KakaoLocalModel.self) { response in
            switch response.result {
            case .success(let result):
                print(result.documents)
                viewController.successSearchAddressResult(result: result.documents ?? [])
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getsLocationAddress(coordinate: KakaoLocationAddressInput, viewController: MapTownViewController){
        
        AF.request("https://dapi.kakao.com/v2/local/geo/coord2regioncode.json", method: .get, parameters: ["x": coordinate.x, "y": coordinate.y],  encoding: URLEncoding.queryString, headers: self.headers).validate().responseDecodable(of: KakaoLocationAddressModel.self) { response in
            switch response.result {
            case .success(let result):
                print("성공?")
                viewController.successGetLocationAddress(result: result)
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

struct KakaoLocationAddressInput: Encodable{
    var x: String
    var y: String
}
