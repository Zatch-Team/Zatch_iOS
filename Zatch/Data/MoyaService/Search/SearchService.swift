//
//  SearchService.swift
//  Zatch
//
//  Created by 박소윤 on 2023/05/22.
//

import Foundation

public class SearchService {
    
    static let shared = SearchService()
    let provider = BaseService(plugins: [MoyaLoggerPlugin()])
    
    private init() { }
    
    func getPopularKeywords(completion: @escaping (Result<PopularKeywordsResponseModel, Error>) -> Void){
        provider.requestDecoded(SearchRouter.getPopularKeywords){ response in
            completion(response)
        }
    }
}
