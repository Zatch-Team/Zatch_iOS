//
//  PopularKeywordUseCase.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/20.
//

import Foundation
import RxSwift

protocol PopularKeywordUseCaseInterface {
    func execute() -> Observable<[PopularKeywords]?>
}

final class PopularKeywordUseCase: PopularKeywordUseCaseInterface {

    private let searchRepository: SearchRepositotyInterface

    init(searchRepository: SearchRepositotyInterface = SearchRepository()) {
        self.searchRepository = searchRepository
    }

    func execute() -> Observable<[PopularKeywords]?>{
        return searchRepository.getPopularKeywords()
    }
}
