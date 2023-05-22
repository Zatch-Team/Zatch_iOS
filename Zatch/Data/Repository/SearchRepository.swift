//
//  SearchRepository.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation
import RxSwift

class SearchRepository: SearchRepositotyInterface{

    func getSearchResult() {
        
    }

    func getPopularKeywords() -> Observable<[PopularKeywords]?> {
        let observable = Observable<[PopularKeywords]?>.create { observer -> Disposable in
            let requestReference: () = SearchService.shared.getPopularKeywords{ response in
                switch response {
                case .success(let data):
                    observer.onNext(data.popularItem)
                case .failure:
                    observer.onNext(nil)
                }
            }
            return Disposables.create(with: { requestReference })
        }
        return observable
    }
}
