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
    
    func getsLocationAddress(x: String, y: String, viewController: MapTownViewController){
        print("호출 조")
        AF.request("https://dapi.kakao.com/v2/local/geo/coord2regioncode.json", method: .get, parameters: ["x": x, "y": y], encoding: URLEncoding.queryString, headers: self.headers).validate().responseDecodable(of: KakaoLocationAddressModel.self) { response in
            switch response.result {
            case .success(let result):
                viewController.successGetLocationAddress(result: result)
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
